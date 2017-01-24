//
//  JokeRequestManager.swift
//  ZMWJoke
//
//  Created by speedx on 16/9/1.
//  Copyright © 2016年 shandandan. All rights reserved.
//

import UIKit
import Alamofire

class JokeRequestManager: BaseRequestManager {

    class func contentRequestAction(parameters:NSDictionary, completion:@escaping (_ isSuccessed:Bool,_ code:Int?,_ jsonValue:AnyObject?) -> ()) {
        // 根据参数拼接成url
        var page : Int = 1
        if let aPage = parameters["page"] {
            page = aPage as! Int
        }
        var pageSize : Int = 20
        if let aPageSize = parameters["pageSize"] {
            pageSize = aPageSize as! Int
        }
        let lastString = String.init(format: "https://japi.juhe.cn/joke/content/text.from?page=%d&pagesize=%d&key=%@", page,pageSize,"b13defd332c76c3abf2895f7796e2a45")
        BaseRequestManager.baseRequestAction(urlString:lastString, method: HTTPMethod.get, parameters: parameters, completion: completion)
        
    }

}
