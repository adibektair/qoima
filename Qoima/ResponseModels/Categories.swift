//
//  Categories.swift
//  Qoima
//
//  Created by root user on 5/11/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import ObjectMapper


class Category : NSObject, NSCoding, Mappable{

    var createdAt : String?
    var descriptionField : String?
    var id : Int?
    var name : String?
    var updatedAt : String?


    class func newInstance(map: Map) -> Mappable?{
        return Category()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        createdAt <- map["created_at"]
        descriptionField <- map["description"]
        id <- map["id"]
        name <- map["name"]
        updatedAt <- map["updated_at"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }

    }

}
