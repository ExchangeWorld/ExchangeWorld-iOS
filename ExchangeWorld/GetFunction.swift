//
//  GetFunction.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/7.
//  Copyright © 2016年 Apple. All rights reserved.
//

import Foundation

// getType : 1 : facebookID -> star & wait , 2 uid -> exchanging & exchangeHistory , 3 token -> exchangeRequest

func httpGet(URL: String, getType: Int){
    
    let url = NSURL(string: URL)
    let semaphore = DispatchSemaphore(value: 0)
//    var data: 
    
    let task = URLSession.shared.dataTask(with: url! as URL) {(data, response, error) in
        if error != nil
        {
            print("error=\(error)")
        }
        
        if(getType == 1){
        
            do {
                
                var userWait4ExchImageURLArrayNP : [String] = []
                var userWait4ExchCategoryArray : [String] = []
                var userWait4ExchObjNameArray : [String] = []
                
                var userStarImageURLArrayNP : [String] = []
                var userStarCategotyArray : [String] = []
                var userStarObjNameArray : [String] = []
                var userStarOwnerNameArray : [String] = []
                
                var a = data
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//                print("--------------------------")
//                print(json)
//                print("--------------------------")
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
                                                        userWait4ExchImageURLArrayNP.append(dictionary2.value as! String)
                                                        Constants.userWait4ExchImageURLArrayNP = userWait4ExchImageURLArrayNP
                                                    }
                                                    if(dictionary2.key == "name"){
                                                        userWait4ExchObjNameArray.append(dictionary2.value as! String)
                                                        Constants.userWait4ExchObjNameArray = userWait4ExchObjNameArray
                                                    }
                                                    if(dictionary2.key == "category"){
                                                        userWait4ExchCategoryArray.append(dictionary2.value as! String)
                                                        Constants.userWait4ExchCategoryArray = userWait4ExchCategoryArray
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
                                                    userStarImageURLArrayNP.append(dictionary3.value as! String)
                                                    Constants.userStarImageURLArrayNP = userStarImageURLArrayNP
                                                }
                                                if (dictionary3.key == "category"){
                                                    userStarCategotyArray.append(dictionary3.value as! String)
                                                    Constants.userStarCategotyArray = userStarCategotyArray
                                                }
                                                if (dictionary3.key == "name"){
                                                    userStarObjNameArray.append(dictionary3.value as! String)
                                                    Constants.userStarObjNameArray = userStarObjNameArray
                                                }
                                                if (dictionary3.key == "owner"){
                                                    let dictionary3Value = (dictionary3.value as AnyObject)
                                                    for dictionary4 in dictionary3Value as! [String: Any]{
                                                        if (dictionary4.key == "name"){
                                                            userStarOwnerNameArray.append(dictionary4.value as! String)
                                                            Constants.userStarOwnerNameArray = userStarOwnerNameArray
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
                
                var userExchangingOwnerImageURLArrayNP : [String] = []
                var userExchangingOwnerCategoryArray : [String] = []
                var userExchangingOwnerObjNameArray : [String] = []
                var userExchangingOwnerObjDescription : [String] = []
                var userExchangingOtherObjNameArray : [String] = []
                var userExchangingOtherCategoryArray : [String] = []
                var userExchangingOtherImageURLArrayNP : [String] = []
                var userExchangingOtherObjDescription : [String] = []
                var userExchangingOtherNameArray : [String] = []
                
                var userExchangingEIDArray: [Int] = []
                
                var userExchHistoryOwnerObjNameArray : [String] = []
                var userExchHistoryOwnerCategoryArray : [String] = []
                var userExchHistoryOwnerImageURLArrayNP : [String] = []
                var userExchHistoryOtherObjNameArray : [String] = []
                var userExchHistoryOtherCategoryArray : [String] = []
                var userExchHistoryOtherImageURLArrayNP : [String] = []
                var userExchHistoryOtherNameArray : [String] = []
                
                var userExchHistoryEIDArray: [Int] = []
                
                let json = try? JSONSerialization.jsonObject(with: data!, options: [.mutableContainers])
                
                if let array = json as? [Any] {
                    
                    for object in array {
                        
                        if let dictionary = object as? [String: Any] {
                            if let status = dictionary["status"] as? String {
                                print(status)
                                if(status == "completed"){
                                    if let eid = dictionary["eid"] as? Int{
                                        userExchHistoryEIDArray.append(eid)
                                        Constants.userExchHistoryEIDArray = userExchHistoryEIDArray
                                    }
                                    if let owner_goods = dictionary["owner_goods"] as? [String: Any]{
                                        
                                        userExchHistoryOwnerObjNameArray.append(owner_goods["name"] as! String)
                                        Constants.userExchHistoryOwnerObjNameArray = userExchHistoryOwnerObjNameArray
                                        userExchHistoryOwnerCategoryArray.append(owner_goods["category"] as! String)
                                        Constants.userExchHistoryOwnerCategoryArray = userExchHistoryOwnerCategoryArray
                                        userExchHistoryOwnerImageURLArrayNP.append(owner_goods["photo_path"] as! String)
                                        Constants.userExchHistoryOwnerImageURLArrayNP = userExchHistoryOwnerImageURLArrayNP
                                    }
                                    if let other_goods = dictionary["other_goods"] as? [String: Any]{
                                        
                                        userExchHistoryOtherObjNameArray.append(other_goods["name"] as! String)
                                        Constants.userExchHistoryOtherObjNameArray = userExchHistoryOtherObjNameArray
                                        userExchHistoryOtherCategoryArray.append(other_goods["category"] as! String)
                                        Constants.userExchHistoryOtherCategoryArray = userExchHistoryOtherCategoryArray
                                        userExchHistoryOtherImageURLArrayNP.append(other_goods["photo_path"] as! String)
                                        Constants.userExchHistoryOtherImageURLArrayNP = userExchHistoryOtherImageURLArrayNP
                                        if let other_owner = other_goods["owner"] as? [String: Any]{
                                            userExchHistoryOtherNameArray.append(other_owner["name"] as! String)
                                            Constants.userExchHistoryOtherNameArray = userExchHistoryOtherNameArray
                                        }
                                    }
                                }
                                else if(status == "initiated"){
                                    if let eid = dictionary["eid"] as? Int{
                                        userExchangingEIDArray.append(eid)
                                        Constants.userExchangingEIDArray = userExchangingEIDArray
                                    }
                                    if let owner_goods = dictionary["owner_goods"] as? [String: Any]{
                                        
                                        userExchangingOwnerObjNameArray.append(owner_goods["name"] as! String)
                                        Constants.userExchangingOwnerObjNameArray = userExchangingOwnerObjNameArray
                                        userExchangingOwnerCategoryArray.append(owner_goods["category"] as! String)
                                        Constants.userExchangingOwnerCategoryArray = userExchangingOwnerCategoryArray
                                        userExchangingOwnerImageURLArrayNP.append(owner_goods["photo_path"] as! String)
                                        Constants.userExchangingOwnerImageURLArrayNP = userExchangingOwnerImageURLArrayNP
                                        userExchangingOwnerObjDescription.append(owner_goods["description"] as! String)
                                        Constants.userExchangingOwnerObjDescription = userExchangingOwnerObjDescription
                                        
                                    }
                                    if let other_goods = dictionary["other_goods"] as? [String: Any]{
                                        
                                        userExchangingOtherObjNameArray.append(other_goods["name"] as! String)
                                        Constants.userExchangingOtherObjNameArray = userExchangingOtherObjNameArray
                                        userExchangingOtherCategoryArray.append(other_goods["category"] as! String)
                                        Constants.userExchangingOtherCategoryArray = userExchangingOtherCategoryArray
                                        userExchangingOtherImageURLArrayNP.append(other_goods["photo_path"] as! String)
                                        Constants.userExchangingOtherImageURLArrayNP = userExchangingOtherImageURLArrayNP
                                        userExchangingOtherObjDescription.append(other_goods["description"] as! String)
                                        Constants.userExchangingOtherObjDescription = userExchangingOtherObjDescription
                                        if let other_owner = other_goods["owner"] as? [String: Any]{
                                            userExchangingOtherNameArray.append(other_owner["name"] as! String)
                                            Constants.userExchangingOtherNameArray = userExchangingOtherNameArray
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
        else if (getType == 3){
            do{
                
                var userExchRequestOwnerObjNameArray : [String] = []
                var userExchRequestOwnerCategoryArray : [String] = []
                var userExchRequestOwnerImageURLArrayNP : [String] = []
                var userExchRequestQIDArray : [[Int]] = []
                var userExchRequestQueuerObjNameArray : [[String]] = []
                var userExchRequestQueuerImageURLArrayNP : [[String]] = []
                var userExchRequestQueuerCategoryArray : [[String]] = []
                var userExchRequestQueuerDescriptionArray : [[String]] = []
                var userExchRequestQueuerNameArray : [[String]] = []
                
                
                let json = try? JSONSerialization.jsonObject(with: data!, options: [.mutableContainers])
                
                if let array = json as? [Any] {
                    
                    var myObjCount = 0
                    var queueCount = 10
                    for object in array {
                        if let dictionary = object as? [String: Any] {
                            if let name = dictionary["name"] as? String{
                                userExchRequestOwnerObjNameArray.append(name)
                                Constants.userExchRequestOwnerObjNameArray = userExchRequestOwnerObjNameArray
                            }
                            if let category = dictionary["category"] as? String{
                                userExchRequestOwnerCategoryArray.append(category)
                                Constants.userExchRequestOwnerCategoryArray = userExchRequestOwnerCategoryArray
                            }
                            if let photo_path = dictionary["photo_path"] as? String{
                                userExchRequestOwnerImageURLArrayNP.append(photo_path)
                                Constants.userExchRequestOwnerImageURLArrayNP = userExchRequestOwnerImageURLArrayNP
                            }
                            
                            
                            if let queue = dictionary["queue"] as? [Any]{
                                for object_queue in queue {
                                    if(myObjCount != queueCount){
                                        if let dictionary2 = object_queue as? [String: Any]{
                                            if let qid = dictionary2["qid"] as? Int{
                                                userExchRequestQIDArray.append([qid])
                                                queueCount = myObjCount
                                            }
                                            if let queuer_goods = dictionary2["queuer_goods"] as? [String: Any]{
                                                if let name = queuer_goods["name"] as? String{
                                                    userExchRequestQueuerObjNameArray.append([name])
                                                }
                                                if let photo_path = queuer_goods["photo_path"] as? String{
                                                    print("11111111111")
                                                    print(photo_path)
                                                    var photo_path2 = [photo_path]
                                                    photo_path2 = urlArrayTranformation(url: photo_path2)
                                                    userExchRequestQueuerImageURLArrayNP.append(photo_path2)
                                                }
                                                if let category = queuer_goods["category"] as? String{
                                                    userExchRequestQueuerCategoryArray.append([category])
                                                }
                                                if let description = queuer_goods["description"] as? String{
                                                    userExchRequestQueuerDescriptionArray.append([description])
                                                }
                                                if let owner = queuer_goods["owner"] as? [String: Any]{
                                                    if let owner_name = owner["name"] as? String{
                                                        userExchRequestQueuerNameArray.append([owner_name])
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    else{
                                        if let dictionary2 = object_queue as? [String: Any]{
                                            if let qid = dictionary2["qid"] as? Int{
                                                userExchRequestQIDArray[queueCount].append(qid)
                                            }
                                            if let queuer_goods = dictionary2["queuer_goods"] as? [String: Any]{
                                                if let name = queuer_goods["name"] as? String{
                                                    userExchRequestQueuerObjNameArray[queueCount].append(name)
                                                }
                                                if let photo_path = queuer_goods["photo_path"] as? String{
                                                    print("222222222")
                                                    print(photo_path)
                                                    var photo_path2 = [photo_path]
                                                    photo_path2 = urlArrayTranformation(url: photo_path2)
                                                    //userExchRequestQueuerImageURLArrayNP.append([photo_path])
                                                    userExchRequestQueuerImageURLArrayNP[queueCount].append(photo_path2[0])
                                                }
                                                if let category = queuer_goods["category"] as? String{
                                                    userExchRequestQueuerCategoryArray[queueCount].append(category)
                                                }
                                                if let description = queuer_goods["description"] as? String{
                                                    userExchRequestQueuerDescriptionArray[queueCount].append(description)
                                                }
                                                
                                                if let owner = queuer_goods["owner"] as? [String: Any]{
                                                    if let owner_name = owner["name"] as? String{
                                                        userExchRequestQueuerNameArray[queueCount].append(owner_name)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                myObjCount += 1
                            }
                        }
                    }
                }
                Constants.userExchRequestQIDArray = userExchRequestQIDArray
                Constants.userExchRequestQueuerObjNameArray = userExchRequestQueuerObjNameArray
                Constants.userExchRequestQueuerImageURLArrayNP = userExchRequestQueuerImageURLArrayNP
                Constants.userExchRequestQueuerCategoryArray = userExchRequestQueuerCategoryArray
                Constants.userExchRequestQueuerDescriptionArray = userExchRequestQueuerDescriptionArray
                Constants.userExchRequestQueuerNameArray = userExchRequestQueuerNameArray
                Constants.userExchRequestOwnerImageURLArrayP = urlArrayTranformation(url: userExchRequestOwnerImageURLArrayNP)
                Constants.userExchRequestQueuerImageURLArrayP = userExchRequestQueuerImageURLArrayNP
                print(Constants.userExchRequestOwnerObjNameArray)
                print(Constants.userExchRequestOwnerCategoryArray)
                print(Constants.userExchRequestQIDArray)
                print(Constants.userExchRequestQueuerObjNameArray)
                print(Constants.userExchRequestQueuerImageURLArrayNP)
                print(Constants.userExchRequestQueuerCategoryArray)
                print(Constants.userExchRequestQueuerDescriptionArray)
                print(Constants.userExchRequestQueuerNameArray)
                print(Constants.userExchRequestQueuerImageURLArrayP)
                
            }
        }
        
        
        
        semaphore.signal()
    }
    task.resume()
    semaphore.wait()
}

