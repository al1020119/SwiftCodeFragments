//
//  ImageMaskTransition.swift
//  gwlTransformAnim
//
//  Created by wangrui on 16/8/30.
//  Copyright © 2016年 tools. All rights reserved.
//

import UIKit

class ImageMaskTransition: NSObject {
    var animator:ImageMaskAnimator
    
    init(fromImageView:UIImageView , toImageView:UIImageView) {
        self.animator = ImageMaskAnimator()
        animator.fromImageView = fromImageView
        animator.toImageView = toImageView
        super.init()
    }
}

extension ImageMaskTransition : UINavigationControllerDelegate,UIViewControllerTransitioningDelegate{
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .pop:
            self.animator.transitionType = ImageMaskTransitionType.dismiss
            return self.animator
        case .push:
            self.animator.transitionType = ImageMaskTransitionType.present
            return self.animator
        default:
            return nil
        }
    }
    
    // 返回present的动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.animator.transitionType = ImageMaskTransitionType.present
        return self.animator
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.animator.transitionType = ImageMaskTransitionType.dismiss
        return self.animator
    }
}
