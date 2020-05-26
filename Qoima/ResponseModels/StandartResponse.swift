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


class PlanResponse : NSObject, NSCoding, Mappable{

    var item : Item?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return PlanResponse()
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


class QoimaResponse : NSObject, NSCoding, Mappable{

    var qoima : [Qoima]?
    var succes : Bool?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return QoimaResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        qoima <- map["qoima"]
        succes <- map["succes"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         qoima = aDecoder.decodeObject(forKey: "qoima") as? [Qoima]
         succes = aDecoder.decodeObject(forKey: "succes") as? Bool
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if qoima != nil{
            aCoder.encode(qoima, forKey: "qoima")
        }
        if succes != nil{
            aCoder.encode(succes, forKey: "succes")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}
class Qoima : NSObject, NSCoding, Mappable{

    var address : String?
    var createdAt : String?
    var descriptionField : String?
    var email : String?
    var id : Int?
    var latitude : String?
    var longitude : String?
    var mapAddress : String?
    var name : String?
    var phone : String?
    var updatedAt : String?
    var urlAddress : String?
    var workingTime : String?


    class func newInstance(map: Map) -> Mappable?{
        return Qoima()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        address <- map["address"]
        createdAt <- map["created_at"]
        descriptionField <- map["description"]
        email <- map["email"]
        id <- map["id"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        mapAddress <- map["map_address"]
        name <- map["name"]
        phone <- map["phone"]
        updatedAt <- map["updated_at"]
        urlAddress <- map["url_address"]
        workingTime <- map["working_time"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         address = aDecoder.decodeObject(forKey: "address") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         email = aDecoder.decodeObject(forKey: "email") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         latitude = aDecoder.decodeObject(forKey: "latitude") as? String
         longitude = aDecoder.decodeObject(forKey: "longitude") as? String
         mapAddress = aDecoder.decodeObject(forKey: "map_address") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         phone = aDecoder.decodeObject(forKey: "phone") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         urlAddress = aDecoder.decodeObject(forKey: "url_address") as? String
         workingTime = aDecoder.decodeObject(forKey: "working_time") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if address != nil{
            aCoder.encode(address, forKey: "address")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if latitude != nil{
            aCoder.encode(latitude, forKey: "latitude")
        }
        if longitude != nil{
            aCoder.encode(longitude, forKey: "longitude")
        }
        if mapAddress != nil{
            aCoder.encode(mapAddress, forKey: "map_address")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if urlAddress != nil{
            aCoder.encode(urlAddress, forKey: "url_address")
        }
        if workingTime != nil{
            aCoder.encode(workingTime, forKey: "working_time")
        }

    }

}


class Notifications : NSObject, NSCoding, Mappable{

    var createdAt : AnyObject?
    var date : String?
    var id : Int?
    var text : String?
    var updatedAt : AnyObject?
    var userID : Int?


    class func newInstance(map: Map) -> Mappable?{
        return Notifications()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        createdAt <- map["created_at"]
        date <- map["date"]
        id <- map["id"]
        text <- map["text"]
        updatedAt <- map["updated_at"]
        userID <- map["userID"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? AnyObject
         date = aDecoder.decodeObject(forKey: "date") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         text = aDecoder.decodeObject(forKey: "text") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? AnyObject
         userID = aDecoder.decodeObject(forKey: "userID") as? Int

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
        if date != nil{
            aCoder.encode(date, forKey: "date")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if text != nil{
            aCoder.encode(text, forKey: "text")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if userID != nil{
            aCoder.encode(userID, forKey: "userID")
        }

    }

}

class NotificationResponse : NSObject, NSCoding, Mappable{

    var notifications : [Notifications]?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return NotificationResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        notifications <- map["notifications"]
        success <- map["success"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         notifications = aDecoder.decodeObject(forKey: "notifications") as? [Notifications]
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if notifications != nil{
            aCoder.encode(notifications, forKey: "notifications")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}
