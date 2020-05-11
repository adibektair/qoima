//
//  Parameters.swift
//  Qoima
//
//  Created by root user on 5/11/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import UIKit

class Parameters: NSObject {
    
    var paramTitle : String?
    var keyboardType : UIKeyboardType?
    var isDropDown : Bool? = false
    var isFillable : Bool? = true
    
    
    var isPhoto : Bool? = false
    var descriptionField: String?
    var photo : UIImage?
    var lenght : Int?
    var width : Int?
    var amount : Int?
    var height : Int?
    var sum : Int?
    var categoryId : Int?
    
    func validate() -> Bool{
        if paramTitle != nil &&
        photo != nil &&
        lenght != nil &&
        width != nil &&
        amount != nil &&
        height != nil &&
            categoryId != nil {
            return true
        }
        return false
    }
    
    func getJson() -> [String: AnyObject]{
        let json = ["unique" : Helper.shared().getToken(),
                    "id" : Helper.shared().getValue(byKey: "id"),
                    "name": self.paramTitle,
                    "length": self.lenght,
                    "width": self.width,
                    "height": self.height,
                    "amount": self.amount,
                    "sum": self.sum,
                    "description": "asd",
                    "categoryID" : self.categoryId
            ] as [String : AnyObject]
        return json
    }
}
