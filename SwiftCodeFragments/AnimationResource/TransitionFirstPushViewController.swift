//
//  TransitionFirstPushViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/6.
//  Copyright © 2017年 SpeedX. All rights reserved.
//  转场动画最简单的方法  第一页 push方式

import UIKit

class TransitionFirstPushViewController: UIViewController,UIViewControllerTransitioningDelegate,UINavigationControllerDelegate {
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = UIColor.lightGray   
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.pushAction()
        }
        
        // 转场动画开始
        func pushAction() -> Void {
            let vc = TransitionSecondPushViewController()
            self.navigationController?.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    
    // push 动画
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .pop:
            let animation = TransitionAnimation()
            animation.isIn = false
            return animation
        case .push:
            let animation = TransitionAnimation()
            animation.isIn = true
            return animation
        default:
            return nil
        }
    }

}

