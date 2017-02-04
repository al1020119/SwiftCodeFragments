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

    var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLoadingView()
        self.initSegment()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func initSegment() -> Void {
        segment = UISegmentedControl.init(items: ["旋转","变小","缩放","变大4","中和"])
        segment.frame = CGRect.init(x: 10, y: SCREEN_HEIGHT - 50 - NAVIGATIONBAR_HEIGHT, width: SCREEN_WIDTH - 20, height: 40)
        self.view.addSubview(segment)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(clickSegmentAction), for: .valueChanged)
        loadingView.angleAnimation()
    }
    
    func clickSegmentAction() -> Void {
        if segment.selectedSegmentIndex == 0 {
            loadingView.angleAnimation()
        } else if segment.selectedSegmentIndex == 1 {
            loadingView.lineAnimationOne()
        } else if segment.selectedSegmentIndex == 2 {
            loadingView.lineAnimationTwo()
        } else if segment.selectedSegmentIndex == 3 {
            loadingView.lineAnimationThree()
        } else if segment.selectedSegmentIndex == 4 {
            loadingView.startAnimation()
        }
    }
    
    func initLoadingView() -> Void {
        if loadingView == nil {
            loadingView = WCLLoadingView.init(frame: CGRect.init(x: 50, y: 50, width: 100, height: 100))
            self.view.addSubview(loadingView)
        }
    }

}
