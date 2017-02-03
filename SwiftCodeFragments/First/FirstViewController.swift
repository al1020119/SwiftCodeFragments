//
//  FirstViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/1/24.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 请求文字内容
        self.reqestContent()
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
}
