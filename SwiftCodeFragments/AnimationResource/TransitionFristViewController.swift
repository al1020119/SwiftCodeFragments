//
//  TransitionFristViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/6.
//  Copyright © 2017年 SpeedX. All rights reserved.
//  转场动画最简单的方法  第一页

import UIKit

class TransitionFristViewController: UIViewController,UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.presentAction()
    }
    
    // 转场动画开始
    func presentAction() -> Void {
        let vc = TransitionSecondViewController()
        vc.transitioningDelegate = self
        let navi = UINavigationController.init(rootViewController: vc)
        navi.transitioningDelegate = self
        self.present(navi, animated: true, completion: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animation = TransitionAnimation()
        animation.isIn = true
        return animation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animation = TransitionAnimation()
        animation.isIn = false
        return animation
    }
}
