//
//  GetFunction.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/7.
//  Copyright © 2016年 Apple. All rights reserved.
//

import Foundation

func httpGet(URL: String, alreadyGetUID: Int){
    //get uid, userStarImage
    
//    let url = NSURL(string: "\(Constants.API_SERVER_URL)/api/user?identity=\(Constants.facebookID)")
    let url = NSURL(string: URL)
    
    let task = URLSession.shared.dataTask(with: url! as URL) {(data, response, error) in
        if error != nil
        {
            print("error=\(error)")
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            print("--------------------------")
            print(json)
            print("--------------------------")
            if(alreadyGetUID == 1){
                for dictionary1 in json as! [String: Any] {
                    if(dictionary1.key == "uid"){
                        Constants.uid = dictionary1.value as! Int
                    }
                
                    if(dictionary1.key == "star_starring_user"){
                    
                        let dictionary1Value = (dictionary1.value as? [AnyObject] ?? [])
                        //if (dictionary1Value != NSNull){
                        if(dictionary1Value.count != 0){
                            for count in 0...dictionary1Value.count-1{
                                for dictionary2 in dictionary1Value[count] as! [String: Any]{
                                    if(dictionary2.key == "goods"){
                                        let dictionary2Value = (dictionary2.value as AnyObject)
                                        if(dictionary2Value.count != 0){
                                        for dictionary3 in dictionary2Value as! [String: Any]{
                                            if(dictionary3.key == "photo_path"){
                                                Constants.userStarImageURLArrayNP.append(dictionary3.value as! String)
                                            }
                                            if (dictionary3.key == "category"){
                                                Constants.userStarCategotyArray.append(dictionary3.value as! String)
                                            }
                                            if (dictionary3.key == "name"){
                                                Constants.userStarObjNameArray.append(dictionary3.value as! String)
                                            }
                                            if (dictionary3.key == "owner"){
                                                let dictionary3Value = (dictionary3.value as AnyObject)
                                                for dictionary4 in dictionary3Value as! [String: Any]{
                                                    if (dictionary4.key == "name"){
                                                        Constants.userStarOwnerNameArray.append(dictionary4.value as! String)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            Constants.userStarImageURLArrayP = urlArrayTranformation(url: Constants.userStarImageURLArrayNP)
            if(alreadyGetUID == 1){
                httpGet(URL: "\(Constants.API_SERVER_URL)/api/user?uid=\(Constants.uid)",alreadyGetUID: 2)
            }
            else if(alreadyGetUID == 2){
                print("successed called uid func")
            }
            
            
        }catch{
            print("JSONERROR")
        }
    }
    task.resume()
}

