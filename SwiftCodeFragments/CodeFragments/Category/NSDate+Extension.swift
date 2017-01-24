//
//  NSDate+Extension.swift
//  PinGo
//
//  Created by GaoWanli on 16/1/31.
//  Copyright © 2016年 GWL. All rights reserved.
//

import Foundation

enum dateFormatStyle: String {
    case Style1 = "yyyy-MM-dd"
}

extension NSDate {
    
    class func formatterWithStyle(withStyle style: dateFormatStyle) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = NSLocale.current
        formatter.dateFormat = style.rawValue
        return formatter
    }
    
    /**
     根据时间戳返回日期
     
     - parameter stamp: 时间戳字符串
     
     - returns: 日期
     */
    class func dateWithTimeStamp(stamp: String) -> NSDate? {
        if let interval = TimeInterval(stamp) {
            return NSDate(timeIntervalSince1970: interval / 1000.0)
        }
        return nil
    }
    
    /**
     根据日期返回字符串格式
     
     - returns: 日期字符串
     */
    func string(withStyle style: dateFormatStyle) -> String? {
        switch style {
        case .Style1:
            let formatter = NSDate.formatterWithStyle(withStyle: style)
            return formatter.string(from: self as Date)
        }
    }
    
    private func dateFormat() -> Date {
        let formatter = NSDate.formatterWithStyle(withStyle: .Style1)
        let dateStr = formatter.string(from: self as Date)
        return formatter.date(from: dateStr)!
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
