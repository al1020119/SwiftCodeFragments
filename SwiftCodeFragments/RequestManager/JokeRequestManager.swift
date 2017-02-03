//
//  JokeRequestManager.swift
//  ZMWJoke
//
//  Created by speedx on 16/9/1.
//  Copyright © 2016年 shandandan. All rights reserved.
//

import UIKit
import Alamofire

// 文字列表的url
let kContentUrl     =   "joke/content/text.from"

class JokeRequestManager: BaseRequestManager {

    class func contentRequestAction(page: Int, completion:@escaping(_ isSuccessed:Bool,_ code:Int?,_ jsonValue:AnyObject?) -> ()) {
        // url
        let urlString = String.init(format: "%@%@", kBase_url,kContentUrl)
        // 参数
        let parameters = ["page" : page, "pageSize" : 20, "key" : kRequest_key] as [String : Any]
        BaseRequestManager.baseRequestAction(urlString:urlString, method: HTTPMethod.get, parameters: parameters, completion: completion)
    }
}
