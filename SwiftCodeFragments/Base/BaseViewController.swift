//
//  BaseViewController.swift
//  ZMWJoke
//
//  Created by xiaoming on 16/8/27.
//  Copyright © 2016年 shandandan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏颜色
        let naviBgImage = UIImage.imageWithColor(color: UIColor.white, size: CGSize.init(width: SCREEN_WIDTH, height: NAVIGATIONBAR_HEIGHT))
        navigationController?.navigationBar.setBackgroundImage(naviBgImage, for: .default)
        // 添加这行就可以实现导航栏下面的横线隐藏了。
        //navigationController?.navigationBar.shadowImage = UIImage()
    
        // 设置统一的背景颜色
        self.view.backgroundColor = UIColor.white
    
    }

    
}
