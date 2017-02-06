//
//  TransitionSecondViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/6.
//  Copyright © 2017年 SpeedX. All rights reserved.
//  转场动画最简单的方法  第二页

import UIKit

class TransitionSecondViewController: UIViewController {

    public let name = "second"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }

}
