//
//  FirstViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/1/24.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit
import CryptoSwift

class FirstViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 请求文字内容
        self.reqestContent()
        // 测试加密
        self.sslAction()
    }

    func reqestContent() -> Void {
        JokeRequestManager.contentRequestAction(page: 1) { (isSuccessed, code, result) in
            if isSuccessed {
                if let result = result {
                    print("结果===",result)
                }
            }
        }
    }
    
    // test 加密算法
    func sslAction() -> Void {
        let pwd = "123456"
        let lastPwd = pwd.md5()
        JCLog(lastPwd)
        
        let pwd2 = pwd + "name"
        let lastPwd2 = pwd2.md5()
        JCLog(lastPwd2)
        
    }
}
