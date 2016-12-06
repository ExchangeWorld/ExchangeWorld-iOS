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
    
    for Count in 1 ... url.count {
        
        let imageArray2 = url[Count-1].characters.map { String($0) }
        var imageURL : String = ""
        
        for i in 3 ... imageArray2.count-2{
            imageURL = imageURL + imageArray2[i-1]
        }
        imageURLArray.append(imageURL)
    }
    return imageURLArray
}
