//
//  MoreViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/1/24.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class MoreViewController: BaseViewController {

    var nameTextField : UITextField!
    var pwdTextField : UITextField!
    var loginButton : UIButton!
    var userModel : UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "登录-MVVM-RAC5.0"
        self.view.backgroundColor = UIColor.white
        
        userModel = UserModel()
        userModel?.name = "小明"
        self.initAllView()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        pwdTextField.resignFirstResponder()
    }
    
    // 创建控件
    func initAllView() -> Void {
        // 用户名
        nameTextField = UITextField.init(frame: CGRect.init(x: 10, y: 10, width: SCREEN_WIDTH - 10 * 2, height: 40))
        nameTextField.placeholder = "用户名（6-16位）"
        self.view.addSubview(nameTextField)
        // 密码
        pwdTextField = UITextField.init(frame: CGRect.init(x: nameTextField.x, y: nameTextField.bottom + 20, width: nameTextField.width, height: nameTextField.height))
        pwdTextField.placeholder = "密码（6-16位）"
        self.view.addSubview(pwdTextField)
        // 登录按钮
        loginButton = Tool.initAButton(frame: CGRect.init(x: 0, y: 0, width: 80, height: 45), titleString: "登录", font: UIFont.systemFont(ofSize: 15), textColor: .red, bgImage: nil)
        self.view.addSubview(loginButton)
        loginButton.center = self.view.center
        // combineLatest 是需要里面的每个signal 都执行了至少一次才可以。
        Signal.combineLatest(nameTextField.reactive.continuousTextValues,pwdTextField.reactive.continuousTextValues).map({ (name, pwd) -> Bool in
            if (name?.length)! >= 6 && (name?.length)! <= 16 && (pwd?.length)! >= 6 && (pwd?.length)! <= 16 {
                self.loginButton.backgroundColor = UIColor.blue
                return true
            } else {
                self.loginButton.backgroundColor = UIColor.black
                return false
            }
            
        }).observeValues { (isSuccess) in
            print("是否成功了===\(isSuccess)")
        }
        
        
    }
    
}
