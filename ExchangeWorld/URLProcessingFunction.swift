//
//  URLProcessingFunction.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

import Foundation

func urlArrayTranformation(url : [String]) -> [String]{
    var imageURLArray : [String] = []
    if(url.count != 0){
    for Count in 1 ... url.count {
        
        let imageArray2 = url[Count-1].characters.map { String($0) }
        var imageURL : String = ""
        
        for i in 3 ... imageArray2.count-2{
            imageURL = imageURL + imageArray2[i-1]
        }
        imageURLArray.append(imageURL)
    }
    }
    return imageURLArray
}

func nullToNil(value : AnyObject?) -> AnyObject? {
    if value is NSNull {
        return nil
    } else {
        return value
    }
}

func categoryEngToChi(categoryArray: [String]) -> [String]{
    
    var categoryArrayChi : [String] = []
    if(categoryArray.count != 0){
        for i in 0...categoryArray.count-1{
            for j in 0...Constants.categoriesEngName.count-1{
                if(categoryArray[i] == Constants.categoriesEngName[j]){
                    categoryArrayChi.append(Constants.categoriesChiName[j])
                    break
                }
            }
        }
    }
    return categoryArrayChi
}

/* 不需要這個了，以此紀念
for i in 0 ... exchRequestOwnerImageURLArray.count-1{
    if let checkUrl1 = URL(string: exchRequestOwnerImageURLArray[i]){
        getDataFromUrl(url: checkUrl1, kind: 1){(data, response, error) in }
    }
}
for i in 0 ... exchRequestQueuerImageURLArray.count-1{
    for j in 0 ... exchRequestQueuerImageURLArray[i].count-1{
        if let checkUrl2 = URL(string: exchRequestQueuerImageURLArray[i][j]){
            getDataFromUrl(url: checkUrl2, kind: 2){(data, response, error) in }
        }
    }
    self.myObjCount += 1
}
self.imgOwnerarray = []
self.imgQueuerarray = []
myObjCount = 0


 
 func getDataFromUrl(url: URL, kind: Int, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
 
 let semaphore = DispatchSemaphore(value: 0)
 
 let task = URLSession.shared.dataTask(with: url) {
 (data, response, error) in
 
 if(kind == 1){
 self.imgOwnerarray.append(UIImage(data: data!)!)
 self.exchRequestOwnerImageArray = self.imgOwnerarray
 }
 else if(kind == 2){
 if (self.myObjCount != self.queueCount){
 self.imgQueuerarray.append([UIImage(data: data!)!])
 self.queueCount = self.myObjCount
 }
 else if(self.myObjCount == self.queueCount){
 self.imgQueuerarray[self.queueCount].append(UIImage(data: data!)!)
 }
 self.exchRequestQueuerImageArray = self.imgQueuerarray
 print(self.exchRequestQueuerImageArray.count)
 print(self.imgQueuerarray.count)
 }
 semaphore.signal()
 }
 task.resume()
 semaphore.wait()
 }
 */

