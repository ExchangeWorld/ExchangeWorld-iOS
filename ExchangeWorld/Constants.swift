//
//  Constants.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/11/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

import Foundation

struct Constants {
    static let API_SERVER_SCHEME = "http"
    static let API_SERVER_HOST: String = "exwd.csie.org"
    static let API_SERVER_PORT: Int? = 43002
    
    static var API_SERVER_URL: String {
        var url = "\(API_SERVER_SCHEME)://\(API_SERVER_HOST)"
        if let port = API_SERVER_PORT {
            url += ":\(port)"
        }
        return url
    }
    
    static let categoriesChiName = ["書籍", "教科書", "電子產品", "3C配件", "服飾", "化妝品", "飾品", "食物", "家庭用品", "體育用品", "電玩遊戲", "其他"]
    static let categoriesEngName = ["Books", "Textbooks", "3C", "3C_accessories", "Clothes", "Cosmetic", "Accessories", "Food", "Houseware", "Sports", "Games", "Others"]
    
    static var facebookID : String = ""
    static var facebookProfilePicURL : String = ""
    static var facebookName : String = ""
    static var facebookEmail : String = ""
    static var exwdToken : String = ""
    static var imageInBase64 : String = ""
    static var imageSize : Int = 0
    static var imageType : String = ""
    static var imageURL : String = ""
    static var uid : Int = 0
    static var firstTimeLogin : Bool = false
//    static var position_x : Double = 0
//    static var position_y : Double = 0
    
    /*
        objCount            ->  to know which object is showing to ObjectInfoFromProfileVC
        whichObjCount       ->  to know which object is showing to ObjectInfoFromProfileVC  (交換請求頁)
        whichQueuerCount    ->  to know which object is showing to ObjectInfoFromProfileVC  (交換請求頁 到 看誰排頁)
        whichCase           ->  to tell objectInfoFromProfileVC "which object is showing & from which VC"
        starredOrNot        ->  {true   : object is starred }
                                {false  : not starred       }
        gidToBeQueued       ->  (the object is about to be queued)'s gid
    */
    static var objCount = 100
    static var whichObjCount = 100
    static var whichQueuerCount = 100
    static var whichCase : String = ""
    static var starredOrNot : Bool = false
    static var gidToBeQueued = 100
    static var ownObject2QueueCount = 100
    
    
    
    static var userStarImageURLArrayNP : [String] = []
    static var userStarImageURLArrayP : [String] = []
    static var userStarCategotyArray : [String] = []
    static var userStarObjNameArray : [String] = []
    static var userStarOwnerNameArray : [String] = []
    static var userStarOwnerImageURLArray : [String] = []
    static var userStarGIDArray : [Int] = []
    static var userStarDescriptionArray : [String] = []
    
    
    static var userWait4ExchImageURLArrayNP : [String] = []
    static var userWait4ExchImageURLArrayP : [String] = []
    static var userWait4ExchCategoryArray : [String] = []
    static var userWait4ExchObjNameArray : [String] = []
    static var userWait4ExchDescription : [String] = []
    static var userWait4ExchGIDArray : [Int] = []
    
    
    static var userExchangingOwnerImageURLArrayNP : [String] = []
    static var userExchangingOwnerImageURLArrayP : [String] = []
    static var userExchangingOwnerCategoryArray : [String] = []
    static var userExchangingOwnerObjNameArray : [String] = []
    static var userExchangingOtherImageURLArrayNP : [String] = []
    static var userExchangingOtherImageURLArrayP : [String] = []
    static var userExchangingOtherCategoryArray : [String] = []
    static var userExchangingOtherObjNameArray : [String] = []
    static var userExchangingOtherNameArray : [String] = []
    static var userExchangingOwnerObjDescription : [String] = []
    static var userExchangingOtherObjDescription : [String] = []
    static var userExchangingEIDArray: [Int] = []
    static var userExchangingOtherProfileImageArray : [String] = []
    static var userExchangingOwnerGIDArray : [Int] = []
    static var userExchangingOtherGIDArray : [Int] = []
    
    static var userExchHistoryOwnerImageURLArrayNP : [String] = []
    static var userExchHistoryOtherImageURLArrayNP : [String] = []
    static var userExchHistoryOwnerImageURLArrayP : [String] = []
    static var userExchHistoryOtherImageURLArrayP : [String] = []
    static var userExchHistoryOwnerCategoryArray : [String] = []
    static var userExchHistoryOtherCategoryArray : [String] = []
    static var userExchHistoryOwnerObjNameArray : [String] = []
    static var userExchHistoryOtherObjNameArray : [String] = []
    static var userExchHistoryOtherNameArray : [String] = []
    static var userExchHistoryEIDArray: [Int] = []
    static var userExchHistoryOwnerObjDescription : [String] = []
    static var userExchHistoryOtherObjDescription : [String] = []
    static var userExchHistoryOtherProfileImageArray : [String] = []
    static var userExchHistoryOwnerGIDArray : [Int] = []
    static var userExchHistoryOtherGIDArray : [Int] = []

    static var userExchRequestOwnerImageURLArrayNP : [String] = []
    static var userExchRequestOwnerImageURLArrayP : [String] = []
    static var userExchRequestOwnerCategoryArray : [String] = []
    static var userExchRequestOwnerCategoryArrayChi : [String] = []
    static var userExchRequestOwnerObjNameArray : [String] = []
    static var userExchRequestOwnerGIDArray : [Int] = []
    
    static var userExchRequestQIDArray: [[Int]] = [[]]
    static var userExchRequestQueuerObjNameArray : [[String]] = []
    static var userExchRequestQueuerImageURLArrayNP : [[String]] = []
    static var userExchRequestQueuerImageURLArrayP : [[String]] = []
    static var userExchRequestQueuerCategoryArray : [[String]] = []
    static var userExchRequestQueuerDescriptionArray : [[String]] = []
    static var userExchRequestQueuerNameArray : [[String]] = []
    static var userExchRequestQueuerGIDArray: [[Int]] = []
    static var userExchRequestQueuerProfileImageArray : [[String]] = []
    
    
    
    
}

