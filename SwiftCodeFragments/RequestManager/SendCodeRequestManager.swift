//
//  SendCodeRequestManager.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/17.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit
import Alamofire

// 悦跑圈注册
let kWeiboUrl     =   "http://api.thejoyrun.com/validate/registered"

// kk唱响
let kFeixiUrl     =   "https://sapi.kktv1.com/meShow/entrance"

// 野兽
let kSpeedXUrl    =   "https://tester.speedx.com/api/v2.7/sendSmscode"

class SendCodeRequestManager: BaseRequestManager {
    
    class func sendeCodeRequestAction(phone: String, completion:@escaping(_ isSuccessed:Bool,_ code:Int?,_ jsonValue:AnyObject?) -> ()) {
        // url
        let urlString = String.init(format: "%@",kWeiboUrl)
        // 参数 
        let timeStamp : Int = (Int)(NSDate().timeIntervalSince1970)
        
        let parameters = ["signature" : "871B7667382DCB009AD37D2A64F87DE2", "timestamp" : timeStamp, "cellNumber" : phone, "uicode": "10020059"] as [String : Any]
        BaseRequestManager.base2RequestAction(urlString:urlString, method: HTTPMethod.get, parameters: parameters, completion: completion)
    }
    
    // get短信提交
    class func sendeCode2RequestAction(phone: String, completion:@escaping(_ isSuccessed:Bool,_ code:Int?,_ jsonValue:AnyObject?) -> ()) {
        // url
        let urlString = String.init(format: "%@",kFeixiUrl)
        // 参数
//        {"a":1,"c":528,"FuncTag":40000020,"ir":0,"phoneNum":"18010125752","platform":3,"smsType":8,"userId":0,"sv":"9T7HG53SZWQLA23U7QSLEY6UAS"}
        let parameters = ["a" :
            1, "c" : 528, "FuncTag" : 40000020,"ir":0,"phoneNum":phone,"platform":3,"smsType":8,"userId":0,"sv":"9T7HG53SZWQLA23U7QSLEY6UAS"] as [String : Any]
        BaseRequestManager.base2RequestAction(urlString:urlString, method: HTTPMethod.post, parameters: parameters, completion: completion)
    }
    
    // 野兽注册账号。
    class func sendeCode3RequestAction(phone: String, completion:@escaping(_ isSuccessed:Bool,_ code:Int?,_ jsonValue:AnyObject?) -> ()) {
        // url
        let urlString = String.init(format: "%@",kSpeedXUrl)
        let phoneString = "+86" + phone
        // 参数
        let parameters = ["mobilephone" : phoneString, "msgType" : "regPhone"] as [String : Any]
        BaseRequestManager.base2RequestAction(urlString:urlString, method: HTTPMethod.post, parameters: parameters, completion: completion)
    }
    
}
