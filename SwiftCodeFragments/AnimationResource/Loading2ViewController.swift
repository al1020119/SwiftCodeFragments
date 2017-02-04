//
//  Loading2ViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/4.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit

class Loading2ViewController: UIViewController {

    weak var loadingView:LoadingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //swift3写的
        let loadingView = LoadingView.showLoadingWith(view: view)
        self.loadingView = loadingView
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let loadingView = loadingView {
            loadingView.hideLoadingView()
        }
    }
    
}
