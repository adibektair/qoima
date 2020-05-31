//
//  Constants.swift
//  Qoima
//
//  Created by root user on 5/9/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation

class Constants: NSObject {
    
    private static var sharedReference : Constants{
          let headers = Constants()
          return headers
    }
    
    class func shared() -> Constants {
          return sharedReference
    }
    
    public let registerRequest = "https://laravel.memento-mori.site/api/registeruser"
    public let loginRequest = "https://laravel.memento-mori.site/api/login"
    public let getCategories = "https://laravel.memento-mori.site/api/get/categories"
    public let addItem = "https://laravel.memento-mori.site/api/additem"
    public let getItems = "https://laravel.memento-mori.site/api/listofitems"
    public let planitem = "https://laravel.memento-mori.site/api/planitem"
    public let deliverItem = "https://laravel.memento-mori.site/api/deliveritem"
    public let qoimaList = "https://laravel.memento-mori.site/api/qoima/list"
    public let getUser = "https://laravel.memento-mori.site/api/userinfo"
    public let updateUser = "https://laravel.memento-mori.site/api/updateuser"
    public let getNotifications = "https://laravel.memento-mori.site/api/user/notifications"
    public let updatePassword = "https://laravel.memento-mori.site/api/changepassword"
    public let updateAddress = "https://laravel.memento-mori.site/api/changeaddress"


}
