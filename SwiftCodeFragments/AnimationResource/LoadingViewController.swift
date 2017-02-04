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
    
    let imageView = UIImageView()
    var imageMaskTransiton:ImageMaskTransition? // 转场动画需要


    var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLoadingView()
        self.initSegment()
        
        imageView.image = UIImage(named: "Start-Marker")
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageView.center = CGPoint(x: 200, y: 300)
        self.view.addSubview(imageView)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.delegate = nil
    }
    
    func initSegment() -> Void {
        segment = UISegmentedControl.init(items: ["旋转","变小","缩放","变大4","中和","push"])
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
        } else {
            let vc = TransitionViewController()
            imageMaskTransiton = ImageMaskTransition(fromImageView: imageView,toImageView:vc.imageView)
            // present的方法
            //        dvc.transitioningDelegate = imageMaskTransiton
            //        presentViewController(dvc, animated: true, completion: nil)
            // push的方法
            self.navigationController?.delegate = imageMaskTransiton
            self.navigationController?.pushViewController(vc, animated: true)

        }
    }
    
    func initLoadingView() -> Void {
        if loadingView == nil {
            loadingView = WCLLoadingView.init(frame: CGRect.init(x: 50, y: 50, width: 100, height: 100))
            self.view.addSubview(loadingView)
        }
    }

}
