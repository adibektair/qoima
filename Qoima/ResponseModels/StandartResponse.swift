//
//  StandartResponse.swift
//  Qoima
//
//  Created by root user on 5/9/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import ObjectMapper


class StandartResponse : NSObject, NSCoding, Mappable{

    var message : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return StandartResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        message <- map["message"]
        success <- map["success"]
        
    }


    @objc required init(coder aDecoder: NSCoder)
    {
         message = aDecoder.decodeObject(forKey: "message") as? String
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}


class ItemsResponse : NSObject, NSCoding, Mappable{

    var items : [Items]?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return ItemsResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        items <- map["items"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         items = aDecoder.decodeObject(forKey: "items") as? [Items]
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if items != nil{
            aCoder.encode(items, forKey: "items")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}

class Items : NSObject, NSCoding, Mappable{

    var amount : String?
    var createdAt : String?
    var descriptionField : String?
    var height : String?
    var id : Int?
    var length : String?
    var name : String?
    var photo : String?
    var price : Int?
    var qoimaId : Int?
    var status : Int?
    var updatedAt : String?
    var userId : Int?
    var width : String?


    class func newInstance(map: Map) -> Mappable?{
        return Items()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        amount <- map["amount"]
        createdAt <- map["created_at"]
        descriptionField <- map["description"]
        height <- map["height"]
        id <- map["id"]
        length <- map["length"]
        name <- map["name"]
        photo <- map["photo"]
        price <- map["price"]
        qoimaId <- map["qoima_id"]
        status <- map["status"]
        updatedAt <- map["updated_at"]
        userId <- map["user_id"]
        width <- map["width"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         amount = aDecoder.decodeObject(forKey: "amount") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         height = aDecoder.decodeObject(forKey: "height") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         length = aDecoder.decodeObject(forKey: "length") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         photo = aDecoder.decodeObject(forKey: "photo") as? String
         price = aDecoder.decodeObject(forKey: "price") as? Int
         qoimaId = aDecoder.decodeObject(forKey: "qoima_id") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? Int
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         userId = aDecoder.decodeObject(forKey: "user_id") as? Int
         width = aDecoder.decodeObject(forKey: "width") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if amount != nil{
            aCoder.encode(amount, forKey: "amount")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if height != nil{
            aCoder.encode(height, forKey: "height")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if length != nil{
            aCoder.encode(length, forKey: "length")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if photo != nil{
            aCoder.encode(photo, forKey: "photo")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if qoimaId != nil{
            aCoder.encode(qoimaId, forKey: "qoima_id")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
        if width != nil{
            aCoder.encode(width, forKey: "width")
        }

    }

}
