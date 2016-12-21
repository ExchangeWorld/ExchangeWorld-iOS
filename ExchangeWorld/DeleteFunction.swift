//
//  DeleteFunction.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

import Foundation

func httpDelete(URL:String) {
    let URL:NSURL = NSURL(string:URL)!
    let request:NSMutableURLRequest = NSMutableURLRequest(url: URL as URL, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 10)
    let semaphore = DispatchSemaphore(value: 0)
    
    request.httpMethod = "DELETE"
    
    
    
    let task = URLSession.shared.dataTask(with: request as URLRequest) {
        data, response, error in
        
        if error != nil
        {
            print("error=\(error)")
        }
        
        
        do {
            
            let data = data
            let NSresponseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            let responseString: String = NSresponseString! as String
            
            print(responseString)
//            if let object = json as? [String: Any]{
//                
//                if let goods_one_agree = object["goods_one_agree"] as? Bool{
//                    print(goods_one_agree)
//                }
//                if let eid = object["eid"] as? Int{
//                    print(eid)
//                }
//                
//            }
            
        }
        semaphore.signal()
    }
    task.resume()
    semaphore.wait()
}
