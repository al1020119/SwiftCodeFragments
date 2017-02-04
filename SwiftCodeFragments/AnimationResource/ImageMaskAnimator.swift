//
//  ImageMaskAnimator.swift
//  gwlTransformAnim
//
//  Created by wangrui on 16/8/30.
//  Copyright © 2016年 tools. All rights reserved.
//

import UIKit

enum ImageMaskTransitionType {
    case present
    case dismiss
}

class ImageMaskAnimator: NSObject {
    
    var transitionType : ImageMaskTransitionType = .present
    var imageView : UIImageView!
    
    var maskContentView : UIImageView!
    // 点击的图片
    var fromImageView : UIImageView!
    // 将要成为的图片
    var toImageView : UIImageView!
    
}

extension ImageMaskAnimator : UIViewControllerAnimatedTransitioning{
    // 动画的时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.transitionType == .present ? 1.6 : 1.3
    }
    
    // 实际的动画
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        // 当两个视图控制器之间的过度开始时，当前已经存在的视图将会被添加到containView上，而新的视图控制器的视图也在此时被创建，只是不可见而已，接下来就是我们的任务了，将新的视图添加到contrinerView上，默认情况下，过度动画执行完以后，旧视图会在containerView上移除
        let containView  = transitionContext.containerView
        print("\(fromView)" + "\(containView)" + "\(toView)" + "123213123123123")
        let frame = UIScreen.main.bounds
        
        // 动画过程中整个背景图
        maskContentView = UIImageView(frame: frame)
        maskContentView.backgroundColor = UIColor.white
        
        if self.transitionType == .present {
            maskContentView.frame = containView.bounds
            containView.addSubview(self.maskContentView)
            
            let currentFromImageView = self.fromImageView
            let adjustFromRect = currentFromImageView?.convert((currentFromImageView?.bounds)!, to: containView)
            
            let currentToImageView = self.toImageView!
            let adjustToRect = currentToImageView.convert(currentToImageView.bounds, to: containView)
            
            imageView = UIImageView(frame: adjustFromRect!)
            imageView.image = currentFromImageView?.image
            containView.addSubview(imageView)
            
            imageView.layer.shadowColor = UIColor.black.cgColor
            imageView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            imageView.layer.shadowRadius = 10.0
            // 给shadowOpacity一个大于默认值(0)的值，阴影就可以显示在任意图层之下
            imageView.layer.shadowOpacity = 0.8
            
            UIView.animate(withDuration: 0.5 , animations: { 
                self.imageView.frame = adjustToRect
                self.imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                }, completion: { (finish) in
                    UIView .animate(withDuration: 0.3, animations: {
                        self.imageView.transform = CGAffineTransform.identity
                        self.imageView.layer.shadowOpacity = 0.0
                        }, completion: { (finished) in
                            containView.addSubview(toView)
                            containView.bringSubview(toFront: self.imageView)
                            let adjustFrame = self.imageView.convert(self.imageView.bounds, to: self.maskContentView)
                            toView.maskFrom(adjustFrame, duration: 0.8 / 1.6 ,complete: {
                                self.maskContentView.removeFromSuperview()
                                self.imageView.removeFromSuperview()
                                self.maskContentView = nil
                                self.imageView = nil
                                transitionContext.completeTransition(true)
                            })
                    })
            })
        }else{
            maskContentView.frame = containView.bounds
            containView.addSubview(self.maskContentView)
            
            let fromImageView = self.fromImageView
            let toImageView = self.toImageView!
            let adjustFromRect = fromImageView?.convert((fromImageView?.bounds)!, to: containView)
            let adjustToRect = toImageView.convert(toImageView.bounds, to: containView)
            imageView = UIImageView(frame:adjustToRect)
            imageView.image = fromImageView?.image
            containView.addSubview(imageView)
            
            containView.bringSubview(toFront: self.imageView)
            containView.sendSubview(toBack: maskContentView)
            let adjustFrame = self.imageView.convert(self.imageView.bounds, to: self.maskContentView)
            fromView.maskTo(adjustFrame, duration: 0.8 / 1.3 ,complete: {
                self.imageView.layer.shadowColor = UIColor.black.cgColor
                self.imageView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
                self.imageView.layer.shadowRadius = 10.0
                self.imageView.layer.shadowOpacity = 0.8
                UIView.animate(withDuration: 0.5 / 1.3, animations: {
                    self.imageView.frame = adjustFromRect!
                }, completion: { (finished) in
                    self.maskContentView.removeFromSuperview()
                    self.imageView.removeFromSuperview()
                    self.maskContentView = nil
                    self.imageView = nil
                    self.toImageView = nil
                    containView.addSubview(toView)
                    transitionContext.completeTransition(true)
                }) 
                
            })
        }
    }
}
