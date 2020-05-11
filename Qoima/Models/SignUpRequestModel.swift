//
//  SignUpRequestModel.swift
//  Qoima
//
//  Created by root user on 5/9/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
 
class SignUpRequestModel: NSObject {
    
    var name : String?
    var surname : String?
    var email : String?
    var phone : String?
    var password : String?
    
    func validate() -> Bool{
        if name == nil || name == "" ||
            email == nil || email == "" ||
                phone == nil || phone == "" ||
                    password == nil || password == "" ||
                        surname == nil || surname == ""{
                            
                    return false
                            
        }
        return true
    }
    
    func signInValidate() -> Bool{
        if email == nil || email == "" ||
            password == nil || password == ""{
            return false
        }
        return true
    }
    
    func getSignInJson() -> [String: AnyObject]{
        let json = ["email" : email, "password" : password]
        return json as [String : AnyObject]

    }
    
    func getJson() -> [String: AnyObject]{
        let json = ["name" : name, "email" : email, "phoneNo" : phone, "password" : password, "surname" : surname]
        return json as [String : AnyObject]
    }
}
