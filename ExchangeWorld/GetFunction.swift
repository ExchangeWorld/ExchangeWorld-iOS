//
//  GetFunction.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/7.
//  Copyright © 2016年 Apple. All rights reserved.
//

import Foundation

// getType : 1 : facebookID -> star & wait , 2 uid -> exchanging & exchange History

func httpGet(URL: String, getType: Int){


    let url = NSURL(string: URL)
    
    let task = URLSession.shared.dataTask(with: url! as URL) {(data, response, error) in
        if error != nil
        {
            print("error=\(error)")
        }
        
        if(getType == 1){
        
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print("--------------------------")
                print(json)
                print("--------------------------")
                    for dictionary1 in json as! [String: Any] {
                        if(dictionary1.key == "uid"){
                            Constants.uid = dictionary1.value as! Int
                        }
                
                        if(dictionary1.key == "goods"){
                            let dictionary1Value = (dictionary1.value as? [AnyObject] ?? [])
                        
                            if(dictionary1Value.count != 0){
                                for count in 0...dictionary1Value.count-1{
                                    for dictionary2 in dictionary1Value[count] as! [String: Any]{
                                        if(dictionary2.key == "exchanged"){
                                            if(dictionary2.value as! Int == 0){
                                                for dictionary2 in dictionary1Value[count] as! [String: Any]{
                                                    if(dictionary2.key == "photo_path"){
                                                        Constants.userWait4ExchImageURLArrayNP.append(dictionary2.value as! String)
                                                    }
                                                    if(dictionary2.key == "name"){
                                                        Constants.userWait4ExchObjNameArray.append(dictionary2.value as! String)
                                                    }
                                                    if(dictionary2.key == "category"){
                                                        Constants.userWait4ExchCategoryArray.append(dictionary2.value as! String)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    
                    
                        if(dictionary1.key == "star_starring_user"){
                    
                            let dictionary1Value = (dictionary1.value as? [AnyObject] ?? [])
                        
                            if(dictionary1Value.count != 0){
                                for count in 0...dictionary1Value.count-1{
                                    for dictionary2 in dictionary1Value[count] as! [String: Any]{
                                        if(dictionary2.key == "goods" && nullToNil(value: dictionary2.value as AnyObject?) != nil){
                                        
                                            let dictionary2Value = (dictionary2.value as AnyObject )
                                        
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
    
                Constants.userWait4ExchImageURLArrayP = urlArrayTranformation(url: Constants.userWait4ExchImageURLArrayNP)
                Constants.userStarImageURLArrayP = urlArrayTranformation(url: Constants.userStarImageURLArrayNP)
            
            
            
            }catch{
                print("JSONERROR1")
            }
        }
        else if (getType == 2){
            do{
                let json = try? JSONSerialization.jsonObject(with: data!, options: [.mutableContainers])
                
                if let array = json as? [Any] {
                    
                    for object in array {
                        
                        if let dictionary = object as? [String: Any] {
                            if let status = dictionary["status"] as? String {
                                print(status)
                                if(status == "completed"){
                                    if let owner_goods = dictionary["owner_goods"] as? [String: Any]{
                                        
                                        Constants.userExchHistoryOwnerObjNameArray.append(owner_goods["name"] as! String)
                                        Constants.userExchHistoryOwnerCategoryArray.append(owner_goods["category"] as! String)
                                        Constants.userExchHistoryOwnerImageURLArrayNP.append(owner_goods["photo_path"] as! String)
                                    }
                                    if let other_goods = dictionary["other_goods"] as? [String: Any]{
                                        
                                        Constants.userExchHistoryOtherObjNameArray.append(other_goods["name"] as! String)
                                        Constants.userExchHistoryOtherCategoryArray.append(other_goods["category"] as! String)
                                        Constants.userExchHistoryOtherImageURLArrayNP.append(other_goods["photo_path"] as! String)
                                        if let other_owner = other_goods["owner"] as? [String: Any]{
                                            Constants.userExchHistoryOtherNameArray.append(other_owner["name"] as! String)
                                        }
                                    }
                                }
                                else if(status == "initiated"){
                                    if let owner_goods = dictionary["owner_goods"] as? [String: Any]{
                                        
                                        Constants.userExchangingOwnerObjNameArray.append(owner_goods["name"] as! String)
                                        Constants.userExchangingOwnerCategoryArray.append(owner_goods["category"] as! String)
                                        Constants.userExchangingOwnerImageURLArrayNP.append(owner_goods["photo_path"] as! String)
                                        Constants.userExchangingOwnerObjDescription.append(owner_goods["description"] as! String)
                                        
                                    }
                                    if let other_goods = dictionary["other_goods"] as? [String: Any]{
                                        
                                        Constants.userExchangingOtherObjNameArray.append(other_goods["name"] as! String)
                                        Constants.userExchangingOtherCategoryArray.append(other_goods["category"] as! String)
                                        Constants.userExchangingOtherImageURLArrayNP.append(other_goods["photo_path"] as! String)
                                        Constants.userExchangingOtherObjDescription.append(other_goods["description"] as! String)
                                        if let other_owner = other_goods["owner"] as? [String: Any]{
                                            Constants.userExchangingOtherNameArray.append(other_owner["name"] as! String)
                                        }
                                    }
                                }
                            }
                        }
                    }
                   
                    Constants.userExchHistoryOtherImageURLArrayP = urlArrayTranformation(url: Constants.userExchHistoryOtherImageURLArrayNP)
                    Constants.userExchHistoryOwnerImageURLArrayP = urlArrayTranformation(url: Constants.userExchHistoryOwnerImageURLArrayNP)
                    Constants.userExchangingOtherImageURLArrayP = urlArrayTranformation(url: Constants.userExchangingOtherImageURLArrayNP)
                    Constants.userExchangingOwnerImageURLArrayP = urlArrayTranformation(url: Constants.userExchangingOwnerImageURLArrayNP)
                    
                }
  
            }catch{
                print("JSONERROR2")
            }
        }
        
        
        
        
    }
    task.resume()
}

