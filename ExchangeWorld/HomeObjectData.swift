//
//  HomeObjectCollection.swift
//  ExchangeWorld
//
//  Created by 盧與明 on 2016/5/30.
//  Copyright © 2016年 Exwd. All rights reserved.
//
//
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

struct OwnerDict {
    var uid: Int = 0
    var photo_path: String = ""
    var name: String = ""
}

extension OwnerDict: Mappable {
    init?(_ map: Map){
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
    init?(_ map: Map){
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
    init?(_ map: Map) {
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
    init(categoryName: String){
        self.categoryName = categoryName
    }
    
    func fetch(completion: (objects: [Object]?) -> Void) {
        let url = "http://exwd.csie.org:43002/api/goods/search?category=\(self.categoryName)"
        print(url)
        Alamofire.request(.GET, url).responseArray { (response: Response<[Object], NSError>) in
            guard response.response?.statusCode < 400 else {
                completion(objects: nil)
                return
            }
            print("hello")
            completion(objects: response.result.value)
        }
    }

}







































