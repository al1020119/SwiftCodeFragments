//
//  Tool.swift
//  swiftDemo1
//
//  Created by xiaoming on 16/3/7.
//  Copyright © 2016年 shandandan. All rights reserved.
//

import Foundation
import UIKit

public class Tool {
    
    /**
     封装的UILabel 初始化
     
     - parameter frame:      大小位置
     - parameter textString: 文字
     - parameter font:       字体
     - parameter textColor:  字体颜色
     
     - returns: UILabel
     */
    public class func initALabel(frame:CGRect,textString:String,font:UIFont,textColor:UIColor) -> UILabel {
        let aLabel = UILabel()
        aLabel.frame = frame
        aLabel.backgroundColor = UIColor.clear
        aLabel.text = textString
        aLabel.font = font
        aLabel.textColor = textColor
//        aLabel.sizeToFit()
        
        return aLabel
    }
    
    /**
     封装的UIButton 初始化
     
     - parameter frame:       位置大小
     - parameter titleString: 按钮标题
     - parameter font:        字体
     - parameter textColor:   标题颜色
     - parameter bgImage:     按钮背景图片
     
     - returns: UIButton
     */
    public class func initAButton(frame:CGRect ,titleString:String, font:UIFont, textColor:UIColor, bgImage:UIImage?) -> UIButton {
        let aButton = UIButton()
        aButton.frame = frame
        aButton.backgroundColor = UIColor.clear
        aButton .setTitle(titleString, for: UIControlState.normal)
        aButton .setTitleColor(textColor, for: UIControlState.normal)
        aButton.titleLabel?.font = font
        if bgImage != nil { // bgImage 必须是可选类型，否则警告
            aButton .setBackgroundImage(bgImage, for: UIControlState.normal)
        }
        
        return aButton
    }
    
    /// 保存NSArray 数据到本地文件
    public class func saveDataToFile(resultArray: NSArray! , fileName: String!) {
        let jsonString : NSString = self.toJSONString(arr: resultArray)!
        let jsonData :Data? = jsonString.data(using: UInt(String.Encoding.utf8.hashValue))
        
        let file = fileName
        let fileUrl = URL(fileURLWithPath: kPathTemp).appendingPathComponent(file!)
        print("fileUrl = \(fileUrl)")
        let data = NSMutableData()
        data.setData(jsonData!)
        if data.write(toFile: fileUrl.path, atomically: true) {
            print("保存成功：\(fileUrl.path)")
        } else {
            print("保存失败：\(fileUrl.path)")
        }
    }
    
    /// 从本地获取json数据
    public class func getJsonFromFile(fileName: String) -> Any? {
        let file = fileName
        let fileUrl = URL(fileURLWithPath: kPathTemp).appendingPathComponent(file)
        if let readData = NSData.init(contentsOfFile: fileUrl.path) {
            let jsonValue = try? JSONSerialization.jsonObject(with: readData as Data, options: .allowFragments)
            print("获取成功：\(fileUrl.path)")
            return jsonValue
        } else {
            print("获取失败：\(fileUrl.path)")
            return nil
        }
    }
    
    /// 转换数组到JSONStirng
    public class func toJSONString(arr: NSArray!) -> NSString? {
        guard let data = try? JSONSerialization.data(withJSONObject: arr, options: .prettyPrinted),
            // Notice the extra question mark here!
            let strJson = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else {
                //throws MyError.InvalidJSON
                return nil
        }
        return strJson
    }
}
