//
//  HomeObjectData.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/10/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

struct OwnerDict {
    var uid: Int = 0
    var photo_path: String = ""
    var name: String = ""
}

extension OwnerDict: Mappable {
    init?(map: Map){
    }
    mutating func mapping(map: Map) {
        self.uid <- map["uid"]
        self.photo_path <- map["photo_path"]
        self.name <- map["name"]
    }
    
}

struct StarGoodDict {
    var sid: Int = 0
    var starring_user_uid: Int = 0
}

extension StarGoodDict: Mappable {
    init?(map: Map){
    }
    mutating func mapping(map: Map) {
        self.sid <- map["sid"]
        self.starring_user_uid <- map["starring_user_uid"]
    }
}

struct Category {
    var name: String
    var objects: [Object]
}

struct Object {
    var gid: Int = 0
    var name: String = ""
    var photo_path: String = ""
    var category: String = ""
    var position_x: Double = 0.0
    var position_y: Double = 0.0
    var description: String = ""
    var owner: OwnerDict!
    var star_goods: [StarGoodDict]!
    
    init?(fromData dict: Object){
        self.gid = dict.gid
        self.name = dict.name
        self.photo_path = dict.photo_path
        self.category = dict.category
        self.position_x = dict.position_x
        self.position_y = dict.position_y
        self.owner = dict.owner
        self.star_goods = dict.star_goods
    }
}

extension Object: Mappable {
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        self.gid <- map["gid"]
        self.name <- map["name"]
        self.photo_path <- map["photo_path"]
        self.category <- map["category"]
        self.position_x <- map["position_x"]
        self.position_y <- map["position_y"]
        self.description <- map["description"]
        self.owner <- map["owner"]
        self.star_goods <- map["star_goods"]
    }
}

struct ExchangeWorldCategoryDataSource {
    var category: Category!
    var categoryName: String
    init?(categoryName: String){
        self.categoryName = categoryName
    }
    
    
    func fetch(completion: @escaping (_ objects: [Object]?) -> Void) {
        let url = "http://exwd.csie.org:43002/api/goods/search"
        print(url)
        let parameters = ["category": self.categoryName]
        print(parameters)
        Alamofire.request(url, method: .get, parameters: parameters).responseArray { (response: DataResponse<[Object]>) in
            guard (response.response?.statusCode)! < 400 else {
                completion(nil)
                return
            }
            print(response.result.value)
            completion(response.result.value)
        }
    }
    
}
