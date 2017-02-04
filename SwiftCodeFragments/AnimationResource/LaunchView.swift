//
//  LaunchView.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/4.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit

let PointX  =   343.5
let PointY  =   242.0
let PointY2 =   424.5


class LaunchView: UIView,CAAnimationDelegate {

    fileprivate var topLayer:CALayer = CALayer()
    fileprivate var bottomLayer:CALayer = CALayer()
    fileprivate var launchImage:UIImage?
    //MARK: Public Methods
    /**
     展开的动画
     */
    func starAnimation() {
        //创建一个CABasicAnimation作用于CALayer的anchorPoint
        let topAnimation = CABasicAnimation.init(keyPath: "anchorPoint")
        //设置移动路径
        topAnimation.toValue = NSValue.init(cgPoint: CGPoint(x: 1, y: 1))
        //动画时间
        topAnimation.duration = 2.6
        //设置代理，方便完成动画后移除当前view
        topAnimation.delegate = self
        //设置动画速度为匀速
        topAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        //设置动画结束后不移除点，保持移动后的位置
        topAnimation.isRemovedOnCompletion = false
        topAnimation.fillMode = kCAFillModeForwards
        topLayer.add(topAnimation, forKey: "topAnimation")
        
        //创建一个CABasicAnimation作用于CALayer的anchorPoint
        let bottomAnimation = CABasicAnimation.init(keyPath: "anchorPoint")
        //设置移动路径
        bottomAnimation.toValue = NSValue.init(cgPoint: CGPoint(x: 0, y: 0))
        //动画时间
        bottomAnimation.duration = 2.6
        //设置动画速度为匀速
        bottomAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        //设置动画结束后不移除点，保持移动后的位置
        bottomAnimation.isRemovedOnCompletion = false
        bottomAnimation.fillMode = kCAFillModeForwards
        bottomLayer.add(bottomAnimation, forKey: "topAnimation")
    }
    
    //MARK: Initial Methods
    convenience init(frame: CGRect, launchImage:UIImage?) {
        self.init(frame:frame)
        self.launchImage = launchImage
        configTopShapeLayer()
        configBottomShapeLayer()
    }
    
    
    //MARK: Privater Methods
    /**
     绘制上半部分的layer
     */
    fileprivate func configTopShapeLayer() {
        //绘制贝斯尔曲线
        let topBezier:UIBezierPath = UIBezierPath()
        topBezier.move(to: CGPoint(x: -1, y: -1))
        topBezier.addLine(to: CGPoint(x: bounds.width+1, y: -1))
        topBezier.addCurve(to: CGPoint(x: bounds.width/2.0+1, y: bounds.height/2.0+1), controlPoint1: CGPoint(x: bounds.width+1, y: 0+1), controlPoint2: CGPoint(x: PointX+1, y: PointY+1))
        topBezier.addCurve(to: CGPoint(x: -1, y: bounds.height+2), controlPoint1: CGPoint(x: 31.5+2, y: PointY2+2), controlPoint2: CGPoint(x: 0+2, y: bounds.height+2))
        topBezier.addLine(to: CGPoint(x: -1, y: -1))
        topBezier.close()
        //创建一个CAShapeLayer，将绘制的贝斯尔曲线的path给CAShapeLayer
        let topShape = CAShapeLayer()
        topShape.path = topBezier.cgPath
        //给topLayer设置contents为启动图
        topLayer.contents = launchImage?.cgImage
        topLayer.frame = bounds
        layer.addSublayer(topLayer)
        //将绘制后的CAShapeLayer做为topLayer的mask
        topLayer.mask = topShape
    }
    
    /**
     绘制下半部分的layer
     */
    fileprivate func configBottomShapeLayer() {
        //绘制贝斯尔曲线
        let bottomBezier:UIBezierPath = UIBezierPath()
        bottomBezier.move(to: CGPoint(x: bounds.width, y: 0))
        bottomBezier.addCurve(to: CGPoint(x: bounds.width/2.0, y: bounds.height/2.0), controlPoint1: CGPoint(x: bounds.width, y: 0), controlPoint2: CGPoint(x: PointX, y: PointY))
        bottomBezier.addCurve(to: CGPoint(x: 0, y: bounds.height), controlPoint1: CGPoint(x: 31.5, y: PointY2), controlPoint2: CGPoint(x: 0, y: bounds.height))
        bottomBezier.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        bottomBezier.addLine(to: CGPoint(x: bounds.width, y: 0))
        bottomBezier.close()
        //创建一个CAShapeLayer，将绘制的贝斯尔曲线的path给CAShapeLayer
        let bottomShape = CAShapeLayer()
        bottomShape.path = bottomBezier.cgPath
        //给bottomLayer设置contents为启动图
        bottomLayer.contents = launchImage?.cgImage
        bottomLayer.frame = bounds
        layer.addSublayer(bottomLayer)
        //将绘制后的CAShapeLayer做为bottomLayer的mask
        bottomLayer.mask = bottomShape
    }
    
    //MRAK: animationDelegate
    /**
     动画完成后移除当前view
     */
//    internal override func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        if flag {
//            removeFromSuperview()
//        }
//    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            removeFromSuperview()
        }
    }

}
