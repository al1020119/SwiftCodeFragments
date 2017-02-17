//
//  NetworkTool.swift
//  PinGo
//
//  Created by GaoWanli on 16/1/16.
//  Copyright © 2016年 GWL. All rights reserved.
//

import UIKit
import Alamofire

let kNetwork_Invalid_Code   =   -3010
let kHttp_Error_Code        =   -3020
let kSocial_Login_Failed    =   -3030

let kResponse_Code_Key      =   "code"
let kResponse_Message_Key   =   "message"
let kResponse_Result_Key    =   "result"

class BaseRequestManager: NSObject {
    
    static let requestBaseManager : BaseRequestManager = BaseRequestManager()
    class func defaultManager() -> BaseRequestManager {
        return requestBaseManager
    }
    
    required override init() {
        super.init()
        
    }
    
    func createRequestCookie() -> Void {
        let sessionToken  = "用户的sessionId"
        let cookie = HTTPCookie(properties: [
            HTTPCookiePropertyKey.name:"sessionid",
            HTTPCookiePropertyKey.value:sessionToken,
            HTTPCookiePropertyKey.path:"/",
            HTTPCookiePropertyKey.domain:kDomain])
        HTTPCookieStorage.shared.setCookie(cookie!)
    }
    
    // 退出登录时候清除cookie
    class func clearRequestCookie() -> Void {
        let sessionToken  = "用户的sessionId"
        let cookie = HTTPCookie(properties: [
            HTTPCookiePropertyKey.name:"sessionid",
            HTTPCookiePropertyKey.value:sessionToken,
            HTTPCookiePropertyKey.path:"/",
            HTTPCookiePropertyKey.domain:kDomain])
        HTTPCookieStorage.shared.deleteCookie(cookie!)
    }
    
//    - (void)createRequestHeader {
//    NSString *userAgent = [NSString stringWithFormat:@"iOS/%f;%@;beast/%@.%@", [[[UIDevice currentDevice] systemVersion] floatValue], [RequestBaseManager getiPhoneModel], [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"], [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
//    
//    NSString *lang      = (([[NSLocale preferredLanguages] objectAtIndex:0]) == nil ? @"" : ([[NSLocale preferredLanguages] objectAtIndex:0]));
//    
//    [[self.sessionManager requestSerializer] setValue:userAgent forHTTPHeaderField:@"User-Agent"];
//    [[self.sessionManager requestSerializer] setValue:lang forHTTPHeaderField:@"X-Client-Lang"];
//    }
    
    func createRequestHeader() -> Void {
        
    }
    
    class func baseRequestAction(urlString: String, method: HTTPMethod, parameters:Dictionary<String, Any>, completion:@escaping (_ isSuccessed:Bool,_ code:Int?,_ result:AnyObject?) -> ()) {
        do {
            // 创建cookie
            self.requestBaseManager.createRequestCookie()
            let headers = ["User-Agent":".....asdfsad","Content-Type":"text/html;charset=UTF-8"]
//            Alamofire.URLSessionConfiguration.default.timeoutIntervalForRequest = 31.0
//            Alamofire.SessionManager.defaultHTTPHeaders.updateValue("text/html;charset=UTF-8", forKey: "Content-Type")

            // url,请求类型,参数
//            Alamofire.URLRequest.setValue("application/json",forHTTPHeaderField:"Content-Type")
            Alamofire.request(urlString, method: method, parameters: parameters, headers: headers).responseJSON(completionHandler: { (response) in
                if let code = response.response?.statusCode {
                    print("code = ",code)
                    if code == kSocial_Login_Failed {
                        // 做统一的重新登录方法
                    }
                }
                // 请求result结果
                if let resultValue = response.result.value as? Dictionary<String, Any> {
                    if let result = resultValue[kResponse_Result_Key] {
                        completion(response.result.isSuccess, response.response?.statusCode, result as AnyObject?)
                    }
                } else {
                    completion(response.result.isSuccess, response.response?.statusCode, nil)
                }
            })
        }
    }
    
    
    class func base2RequestAction(urlString: String, method: HTTPMethod, parameters:Dictionary<String, Any>, completion:@escaping (_ isSuccessed:Bool,_ code:Int?,_ result:AnyObject?) -> ()) {
        do {
            // 创建cookie
//            self.requestBaseManager.createRequestCookie()
//            let headers = ["User-Agent":"æ°´èæ¡ç´æ­ 5.4.5 rv:115 (iPhone; iOS 10.3; zh_CN)","Accept-Encoding":"gzip","Content-Type":"application/x-www-form-urlencoded; charset=utf-8"]
            //            Alamofire.URLSessionConfiguration.default.timeoutIntervalForRequest = 31.0
            // url,请求类型,参数
            let headers = ["User-Agent":".....asdfsad","Content-Type":"text/html;charset=UTF-8"]
            
            Alamofire.request(urlString, method: method, parameters: parameters, headers: headers).responseJSON(completionHandler: { (response) in
                if let code = response.response?.statusCode {
                    print("code = ",code)
                    if code == kSocial_Login_Failed {
                        // 做统一的重新登录方法
                    }
                }
                // 请求result结果
                if let resultValue = response.result.value as? Dictionary<String, Any> {
                    if let result = resultValue[kResponse_Result_Key] {
                        completion(response.result.isSuccess, response.response?.statusCode, result as AnyObject?)
                    } else {
                        completion(response.result.isSuccess, response.response?.statusCode, response.result as AnyObject?)
                    }
                } else {
                    completion(response.result.isSuccess, response.response?.statusCode, response.result as AnyObject?)

                }
            })
        }
    }

}
