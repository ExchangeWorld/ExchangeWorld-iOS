//
//  GetFunction.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/7.
//  Copyright © 2016年 Apple. All rights reserved.
//

import Foundation

/*
 getType :  1 : facebookID -> (star & wait)'s Object Info
            2 : uid -> (exchanging & exchangeHistory)'s Object Info
            3 : token -> exchangeRequest's Object Info
            4 : gid,uid -> check if starred
            5 : facebookID -> firstTimeLogin?
            6 : get description 4 userStar page
 */

func httpGet(URL: String, getType: Int){
    
    let url = NSURL(string: URL)
    let semaphore = DispatchSemaphore(value: 0)

    
    let task = URLSession.shared.dataTask(with: url! as URL) {(data, response, error) in
        if error != nil
        {
            print("error=\(error)")
        }
        
        if(getType == 5){
            print(nullToNil(value: data! as AnyObject?)!)
            do{
                let NSresponseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let responseString: String = NSresponseString! as String
                if(responseString == "null"){
                    Constants.firstTimeLogin = true
                }
            }
        }
        if(getType == 1){
        
            do {
                
                var userWait4ExchImageURLArrayNP : [String] = []
                var userWait4ExchCategoryArray : [String] = []
                var userWait4ExchObjNameArray : [String] = []
                var userWait4ExchDescription : [String] = []
                var userWait4ExchGIDArray : [Int] = []
                
                var userStarImageURLArrayNP : [String] = []
                var userStarCategotyArray : [String] = []
                var userStarObjNameArray : [String] = []
                var userStarOwnerNameArray : [String] = []
                var userStarOwnerImageURL : [String] = []
                var userStarGIDArray : [Int] = []
                
                
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
                                                    if(dictionary2.key == "description"){
                                                        userWait4ExchDescription.append(dictionary2.value as! String)
                                                        Constants.userWait4ExchDescription = userWait4ExchDescription
                                                    }
                                                    if(dictionary2.key == "gid"){
                                                        userWait4ExchGIDArray.append(dictionary2.value as! Int)
                                                        Constants.userWait4ExchGIDArray = userWait4ExchGIDArray
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
                                                if (dictionary3.key == "gid"){
                                                    userStarGIDArray.append(dictionary3.value as! Int)
                                                    Constants.userStarGIDArray = userStarGIDArray
                                                }
                                                if (dictionary3.key == "owner"){
                                                    let dictionary3Value = (dictionary3.value as AnyObject)
                                                    for dictionary4 in dictionary3Value as! [String: Any]{
                                                        if (dictionary4.key == "name"){
                                                            userStarOwnerNameArray.append(dictionary4.value as! String)
                                                            Constants.userStarOwnerNameArray = userStarOwnerNameArray
                                                        }
                                                        if (dictionary4.key == "photo_path"){
                                                            userStarOwnerImageURL.append(dictionary4.value as! String)
                                                            Constants.userStarOwnerImageURLArray = userStarOwnerImageURL
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
                var userExchangingOtherProfileImageArray : [String] = []
                var userExchangingOwnerGIDArray : [Int] = []
                var userExchangingOtherGIDArray : [Int] = []
                
                var userExchangingEIDArray: [Int] = []
                
                var userExchHistoryOwnerObjNameArray : [String] = []
                var userExchHistoryOwnerCategoryArray : [String] = []
                var userExchHistoryOwnerImageURLArrayNP : [String] = []
                var userExchHistoryOtherObjNameArray : [String] = []
                var userExchHistoryOtherCategoryArray : [String] = []
                var userExchHistoryOtherImageURLArrayNP : [String] = []
                var userExchHistoryOtherNameArray : [String] = []
                var userExchHistoryOwnerObjDescription : [String] = []
                var userExchHistoryOtherObjDescription : [String] = []
                var userExchHistoryOtherProfileImageArray : [String] = []
                var userExchHistoryOwnerGIDArray : [Int] = []
                var userExchHistoryOtherGIDArray : [Int] = []
                
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
                                        userExchHistoryOwnerObjDescription.append(owner_goods["description"] as! String)
                                        Constants.userExchHistoryOwnerObjDescription = userExchangingOwnerObjDescription
                                        userExchHistoryOwnerGIDArray.append(owner_goods["gid"] as! Int)
                                        Constants.userExchHistoryOwnerGIDArray = userExchHistoryOwnerGIDArray
                                    }
                                    if let other_goods = dictionary["other_goods"] as? [String: Any]{
                                        
                                        userExchHistoryOtherObjNameArray.append(other_goods["name"] as! String)
                                        Constants.userExchHistoryOtherObjNameArray = userExchHistoryOtherObjNameArray
                                        userExchHistoryOtherCategoryArray.append(other_goods["category"] as! String)
                                        Constants.userExchHistoryOtherCategoryArray = userExchHistoryOtherCategoryArray
                                        userExchHistoryOtherImageURLArrayNP.append(other_goods["photo_path"] as! String)
                                        Constants.userExchHistoryOtherImageURLArrayNP = userExchHistoryOtherImageURLArrayNP
                                        userExchHistoryOtherObjDescription.append(other_goods["description"] as! String)
                                        Constants.userExchHistoryOtherObjDescription = userExchangingOwnerObjDescription
                                        userExchHistoryOtherGIDArray.append(other_goods["gid"] as! Int)
                                        Constants.userExchHistoryOtherGIDArray = userExchHistoryOtherGIDArray
                                        if let other_owner = other_goods["owner"] as? [String: Any]{
                                            userExchHistoryOtherNameArray.append(other_owner["name"] as! String)
                                            Constants.userExchHistoryOtherNameArray = userExchHistoryOtherNameArray
                                            userExchHistoryOtherProfileImageArray.append(other_owner["photo_path"] as! String)
                                            Constants.userExchHistoryOtherProfileImageArray = userExchHistoryOtherProfileImageArray

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
                                        userExchangingOwnerGIDArray.append(owner_goods["gid"] as! Int)
                                        Constants.userExchangingOwnerGIDArray = userExchangingOwnerGIDArray
                                        
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
                                        userExchangingOtherGIDArray.append(other_goods["gid"] as! Int)
                                        Constants.userExchangingOtherGIDArray = userExchangingOtherGIDArray
                                        if let other_owner = other_goods["owner"] as? [String: Any]{
                                            userExchangingOtherNameArray.append(other_owner["name"] as! String)
                                            Constants.userExchangingOtherNameArray = userExchangingOtherNameArray
                                            userExchangingOtherProfileImageArray.append(other_owner["photo_path"] as! String)
                                            Constants.userExchangingOtherProfileImageArray = userExchangingOtherProfileImageArray
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
                var userExchRequestOwnerCategoryArrayChi : [String] = []
                var userExchRequestOwnerGIDArray : [Int] = []
                var userExchRequestQueuerGIDArray : [[Int]] = []
                var userExchRequestQueuerProfileImageArray : [[String]] = []
                
                
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
                            if let gid = dictionary["gid"] as? Int{
                                userExchRequestOwnerGIDArray.append(gid)
                                Constants.userExchRequestOwnerGIDArray = userExchRequestOwnerGIDArray
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
                                                if let gid = queuer_goods["gid"] as? Int{
                                                    userExchRequestQueuerGIDArray.append([gid])
                                                }
                                                if let photo_path = queuer_goods["photo_path"] as? String{
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
                                                    if let photo_path = owner["photo_path"] as? String{
                                                        userExchRequestQueuerProfileImageArray.append([photo_path])
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
                                                if let gid = queuer_goods["gid"] as? Int{
                                                    userExchRequestQueuerGIDArray[queueCount].append(gid)
                                                }
                                                if let photo_path = queuer_goods["photo_path"] as? String{
                                                    var photo_path2 = [photo_path]
                                                    photo_path2 = urlArrayTranformation(url: photo_path2)
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
                                                    if let photo_path = owner["photo_path"] as? String{
                                                        userExchRequestQueuerProfileImageArray[queueCount].append(photo_path)
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
                userExchRequestOwnerCategoryArrayChi = categoryEngToChi(categoryArray: userExchRequestOwnerCategoryArray)
                Constants.userExchRequestOwnerCategoryArrayChi = userExchRequestOwnerCategoryArrayChi
                Constants.userExchRequestOwnerGIDArray = userExchRequestOwnerGIDArray
                Constants.userExchRequestQueuerGIDArray = userExchRequestQueuerGIDArray
                Constants.userExchRequestQueuerProfileImageArray = userExchRequestQueuerProfileImageArray
                
            }
        }
        else if (getType == 4){
            do{
        
                let json = try? JSONSerialization.jsonObject(with: data!, options: [.mutableContainers])
                if let array = json as? [Any] {
                    for object in array {
                        if let dictionary = object as? [String: Any]{
                            if let starring_user_uid = dictionary["starring_user_uid"] as? Int{
                                if (starring_user_uid == Constants.uid){
                                    Constants.starredOrNot = true
                                }
                            }
                        }
                    }
   
                }
            }
        }
        else if (getType == 6){
            do{
                var userStarDescriptionArray : [String] = []
                var userStarDescriptionArrayRealOrder : [String] = []
                
                let json = try? JSONSerialization.jsonObject(with: data!, options: [.mutableContainers])
                if let array = json as? [Any]{
                    for object in array {
                        if let dictionary = object as? [String: Any]{
                            if let goods = dictionary["goods"] as? [String: Any]{
                                if(Constants.userStarImageURLArrayP.count != 0){
                                    //for _ in 0...Constants.userStarImageURLArrayP.count-1{
                                        for j in 0 ... Constants.userStarImageURLArrayP.count-1{
                                            if(Constants.userStarGIDArray[j] == goods["gid"] as? Int){
                                                userStarDescriptionArray.append((goods["description"] as? String)!)
                                            }
                                        }
                                    //}
                                }
                            }
                        }
                    }
                }
                
                for i in 0...userStarDescriptionArray.count-1{
                    userStarDescriptionArrayRealOrder.append(userStarDescriptionArray[userStarDescriptionArray.count-1-i])
                }
                Constants.userStarDescriptionArray = userStarDescriptionArrayRealOrder
                print(Constants.userStarDescriptionArray)
            }
        }
        
        
        semaphore.signal()
    }
    task.resume()
    semaphore.wait()
}

