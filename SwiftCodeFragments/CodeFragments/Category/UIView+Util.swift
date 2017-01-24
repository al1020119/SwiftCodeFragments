//
//  UIView+Util.swift
//  speedxSwift
//
//  Created by speedx on 16/4/21.
//  Copyright © 2016年 speedx. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /// 左边   -   读、写
    func left() -> CGFloat! {
        return self.frame.origin.x
    }
    func left(x:CGFloat) {
        var aFrame : CGRect = self.frame
        aFrame.origin.x = x
        self.frame = aFrame
    }
    /// 上边   -   读、写
    func top() -> CGFloat! {
        return self.frame.origin.y
    }
    func top(y:CGFloat) {
        var aFrame : CGRect = self.frame
        aFrame.origin.y = y
        self.frame = aFrame
    }
    /// 宽度   -   读、写
    func width() -> CGFloat! {
        return self.frame.size.width
    }
    func width(w:CGFloat) {
        var aFrame : CGRect = self.frame
        aFrame.size.width = w
        self.frame = aFrame
    }
    /// 高度   -   读、写
    func height() -> CGFloat! {
        return self.frame.size.height
    }
    func height(h:CGFloat) {
        var aFrame : CGRect = self.frame
        aFrame.size.height = h
        self.frame = aFrame
    }
    /// 右边   -   读
    func right() -> CGFloat! {
        return self.frame.origin.x + self.frame.size.width
    }
    /// 下边   -   读
    func bottom() -> CGFloat! {
        return self.frame.origin.y + self.frame.size.height
    }
    
    /// 中心x   -   读、写
    func centerX() -> CGFloat! {
        return self.center.x
    }
    func centerX(cX:CGFloat) {
        self.center = CGPoint.init(x: cX, y: self.center.y)
    }
    /// 中心y   -   读、写
    func centerY() -> CGFloat! {
        return self.center.y
    }
    func centerY(cY:CGFloat) {
        self.center = CGPoint.init(x: self.center.x, y: cY)
    }

    /// 删除所有子视图
    func removeAllSubViews() {
        while self.subviews.count > 0 {
            let child : UIView  =  self.subviews.last!
            child.removeFromSuperview()
        }
    }
    
    
}
