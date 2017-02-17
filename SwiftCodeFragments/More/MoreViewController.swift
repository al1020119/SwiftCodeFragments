//
//  MoreViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/1/24.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit

class MoreViewController: BaseViewController {

    var textField : UITextField!
    var button : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textField = UITextField(frame: CGRect(x: 10, y: 80, width: SCREEN_WIDTH - 20, height: 50))
        self.textField.backgroundColor = UIColor.white
        self.textField.keyboardType = .namePhonePad
        self.view.addSubview(self.textField)
        
        self.button = UIButton(frame: CGRect(x: 10, y: 20, width: 50, height: 50))
        self.view.addSubview(self.button)
        self.button.setTitle("发送", for: .normal)
        self.button.addTarget(self, action: #selector(reqestContent), for: .touchUpInside)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func reqestContent() -> Void {
        SendCodeRequestManager.sendeCode2RequestAction(phone: self.textField.text!) { (isSuccessed, code, result) in
            if isSuccessed {
                if let result = result {
                    print("结果===",result)
                }
            }
        }
        
        // 野兽的。没问题
//        SendCodeRequestManager.sendeCode3RequestAction(phone: self.textField.text!) { (isSuccessed, code, result) in
//            if isSuccessed {
//                if let result = result {
//                    print("结果===",result)
//                }
//            }
//        }
    }

}
