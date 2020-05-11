//
//  AddItemResponse.swift
//  Qoima
//
//  Created by root user on 5/11/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation

import ObjectMapper


class Photo : NSObject, NSCoding, Mappable{

    var createdAt : String?
    var id : Int?
    var itemID : Int?
    var photoFour : String?
    var photoOne : String?
    var photoThree : String?
    var photoTwo : String?
    var updatedAt : String?


    class func newInstance(map: Map) -> Mappable?{
        return Photo()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        createdAt <- map["created_at"]
        id <- map["id"]
        itemID <- map["itemID"]
        photoFour <- map["photoFour"]
        photoOne <- map["photoOne"]
        photoThree <- map["photoThree"]
        photoTwo <- map["photoTwo"]
        updatedAt <- map["updated_at"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         itemID = aDecoder.decodeObject(forKey: "itemID") as? Int
         photoFour = aDecoder.decodeObject(forKey: "photoFour") as? String
         photoOne = aDecoder.decodeObject(forKey: "photoOne") as? String
         photoThree = aDecoder.decodeObject(forKey: "photoThree") as? String
         photoTwo = aDecoder.decodeObject(forKey: "photoTwo") as? String
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
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if itemID != nil{
            aCoder.encode(itemID, forKey: "itemID")
        }
        if photoFour != nil{
            aCoder.encode(photoFour, forKey: "photoFour")
        }
        if photoOne != nil{
            aCoder.encode(photoOne, forKey: "photoOne")
        }
        if photoThree != nil{
            aCoder.encode(photoThree, forKey: "photoThree")
        }
        if photoTwo != nil{
            aCoder.encode(photoTwo, forKey: "photoTwo")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }

    }

}


class Item : NSObject, NSCoding, Mappable{

    var amount : String?
    var createdAt : String?
    var descriptionField : String?
    var height : String?
    var id : Int?
    var length : String?
    var name : String?
    var photo : Photo?
    var price : String?
    var qoimaId : Int?
    var status : Int?
    var updatedAt : String?
    var userId : String?
    var width : String?


    class func newInstance(map: Map) -> Mappable?{
        return Item()
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
         photo = aDecoder.decodeObject(forKey: "photo") as? Photo
         price = aDecoder.decodeObject(forKey: "price") as? String
         qoimaId = aDecoder.decodeObject(forKey: "qoima_id") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? Int
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         userId = aDecoder.decodeObject(forKey: "user_id") as? String
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


class AddItemResponse : NSObject, NSCoding, Mappable{

    var item : Item?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return AddItemResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        item <- map["item"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         item = aDecoder.decodeObject(forKey: "item") as? Item
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if item != nil{
            aCoder.encode(item, forKey: "item")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}
