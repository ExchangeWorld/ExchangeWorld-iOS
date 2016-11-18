//
//  PostFunction.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/11/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

import Foundation

func httpPost(URL:String,parameters: [String : Any],token:String) {
    let URL:NSURL = NSURL(string:URL)!
    let request:NSMutableURLRequest = NSMutableURLRequest(url: URL as URL, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 10)
    let semaphore = DispatchSemaphore(value: 0)
    var exwdToken = token
    
    
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = ["Content-Type": "application/json"]
    request.httpBody = try! JSONSerialization.data(withJSONObject: parameters , options: [])
    //let jsonString = String(data: request.httpBody!, encoding: .utf8)!
    //NSLog("jsonString = \(jsonString)")
    
    
    
    let task = URLSession.shared.dataTask(with: request as URLRequest) {
        data, response, error in
        
        if error != nil
        {
            print("error=\(error)")
        }
        
        //get token
        do {
            let json = try JSONSerialization.jsonObject(with: data!,options: .mutableContainers)
            for dictionary in json as! [String: Any] {
                if(dictionary.key == "token"){
                    exwdToken = dictionary.value as! String
                    print(exwdToken)
                }
            }
        }catch let jsonError{
            print(jsonError)
        }
        semaphore.signal()
    }
    task.resume()
    semaphore.wait(timeout: .distantFuture)
}
