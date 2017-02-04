//
//  LoadingViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/4.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit

class LoadingViewController: BaseViewController {

    var loadingView: WCLLoadingView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 加载动画
        self.loadingAction()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        loadingView.resumeAnimation()
    }
    
    func loadingAction() -> Void {
        if loadingView == nil {
            loadingView = WCLLoadingView.init(frame: CGRect.init(x: 50, y: 50, width: 100, height: 100))
            self.view.addSubview(loadingView)
        }
        loadingView.startAnimation()
    }

}
