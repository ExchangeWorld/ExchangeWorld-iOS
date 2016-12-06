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
}

