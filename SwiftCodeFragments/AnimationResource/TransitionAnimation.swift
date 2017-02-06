//
//  TransitionAnimation.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/6.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit

class TransitionAnimation: NSObject,UIViewControllerAnimatedTransitioning {
    
    var isIn : Bool?
    
    // 动画时间 -- 必须的方法
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    // 具体动画 -- 必须的方法
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)?.view
        let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)?.view
        
        
        if self.isIn! {
            toView?.alpha = 1.0
            fromView?.alpha = 1.0
            fromView?.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            toView?.frame = CGRect.init(x: 0, y: -SCREEN_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            
            containerView.addSubview(toView!)
            
            // 跟代理动画时候相同
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                toView?.alpha = 1.0
                fromView?.alpha = 1.0
                fromView?.frame = CGRect.init(x: 0, y: SCREEN_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
                toView?.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
                
            }) { (finish) in
                fromView?.alpha = 1.0
                transitionContext.completeTransition(true)
            }
        } else {
            toView?.alpha = 1.0
            fromView?.alpha = 1.0
            fromView?.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            toView?.frame = CGRect.init(x: 0, y: SCREEN_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            
            containerView.addSubview(toView!)
            
            // 跟代理动画时候相同
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                toView?.alpha = 1.0
                fromView?.alpha = 1.0
                fromView?.frame = CGRect.init(x: 0, y: -SCREEN_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
                toView?.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
                
            }) { (finish) in
                fromView?.alpha = 1.0
                transitionContext.completeTransition(true)
            }
        }
        
    }

    
}




























