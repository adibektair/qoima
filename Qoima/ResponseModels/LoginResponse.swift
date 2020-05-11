//
//  LoginResponse.swift
//  Qoima
//
//  Created by root user on 5/9/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import ObjectMapper


class LoginResponse : NSObject, NSCoding, Mappable{

    var message : String?
    var success : Bool?
    var unique : String?
    var user : User?


    class func newInstance(map: Map) -> Mappable?{
        return LoginResponse()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        message <- map["message"]
        success <- map["success"]
        unique <- map["unique"]
        user <- map["user"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         message = aDecoder.decodeObject(forKey: "message") as? String
         success = aDecoder.decodeObject(forKey: "success") as? Bool
         unique = aDecoder.decodeObject(forKey: "unique") as? String
         user = aDecoder.decodeObject(forKey: "user") as? User

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }
        if unique != nil{
            aCoder.encode(unique, forKey: "unique")
        }
        if user != nil{
            aCoder.encode(user, forKey: "user")
        }

    }

}

class User : NSObject, NSCoding, Mappable{

    var account : String?
    var createdAt : String?
    var descriptionField : String?
    var email : String?
    var id : Int?
    var name : String?
    var surname : String?
    var unique : String?
    var updatedAt : String?


    class func newInstance(map: Map) -> Mappable?{
        return User()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        account <- map["account"]
        createdAt <- map["created_at"]
        descriptionField <- map["description"]
        email <- map["email"]
        id <- map["id"]
        name <- map["name"]
        surname <- map["surname"]
        unique <- map["unique"]
        updatedAt <- map["updated_at"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         account = aDecoder.decodeObject(forKey: "account") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         email = aDecoder.decodeObject(forKey: "email") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         surname = aDecoder.decodeObject(forKey: "surname") as? String
         unique = aDecoder.decodeObject(forKey: "unique") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
    {
        if account != nil{
            aCoder.encode(account, forKey: "account")
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
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if surname != nil{
            aCoder.encode(surname, forKey: "surname")
        }
        if unique != nil{
            aCoder.encode(unique, forKey: "unique")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }

    }

}
