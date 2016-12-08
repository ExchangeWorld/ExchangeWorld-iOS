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
    
    static let categoriesCHIName = ["書籍", "教科書", "電子產品", "3C配件", "服飾", "化妝品", "飾品", "食物", "家庭用品", "體育用品", "電玩遊戲", "其他"]
    static let categoriesEngName = ["Books", "Textbooks", "3C", "Clothes", "Cosmetic", "Accessories", "Food", "HouseWare", "Sports", "Games", "Others"]
    
    static var facebookID : String = ""
    static var facebookProfilePicURL : String = ""
    static var facebookName : String = ""
    static var exwdToken : String = ""
    static var imageInBase64 : String = ""
    static var imageSize : Int = 0
    static var imageType : String = ""
    static var imageURL : String = ""
    static var uid : Int = 0
    static var userStarImageURLArrayNP : [String] = []
    static var userStarImageURLArrayP : [String] = []
    static var userStarCategotyArray : [String] = []
    static var userStarObjNameArray : [String] = []
    static var userStarOwnerNameArray : [String] = []
    
    static var userWait4ExchImageURLArrayNP : [String] = []
    static var userWait4ExchImageURLArrayP : [String] = []
    static var userWait4ExchCategoryArray : [String] = []
    static var userWait4ExchObjNameArray : [String] = []
    
    static var userExchangingOwnerImageURLArrayNP : [String] = []
    static var userExchangingOwnerImageURLArrayP : [String] = []
    static var userExchangingOwnerCategoryArray : [String] = []
    static var userExchangingOwnerObjNameArray : [String] = []
    static var userExchangingOtherImageURLArrayNP : [String] = []
    static var userExchangingOtherImageURLArrayP : [String] = []
    static var userExchangingOtherCategoryArray : [String] = []
    static var userExchangingOtherObjNameArray : [String] = []
    static var userExchangingOtherNameArray : [String] = []
    
    static var userExchHistoryOwnerImageURLArrayNP : [String] = []
    static var userExchHistoryOtherImageURLArrayNP : [String] = []
    static var userExchHistoryOwnerImageURLArrayP : [String] = []
    static var userExchHistoryOtherImageURLArrayP : [String] = []
    static var userExchHistoryOwnerCategoryArray : [String] = []
    static var userExchHistoryOtherCategoryArray : [String] = []
    static var userExchHistoryOwnerObjNameArray : [String] = []
    static var userExchHistoryOtherObjNameArray : [String] = []
    static var userExchHistoryOtherNameArray : [String] = []
    

    
    
}

