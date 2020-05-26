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
    
    public let registerRequest = "http://laravel.memento-mori.site/api/registeruser"
    public let loginRequest = "http://laravel.memento-mori.site/api/login"
    public let getCategories = "http://laravel.memento-mori.site/api/get/categories"
    public let addItem = "http://laravel.memento-mori.site/api/additem"
    public let getItems = "http://laravel.memento-mori.site/api/listofitems"
    public let planitem = "http://laravel.memento-mori.site/api/planitem"
    public let deliverItem = "http://laravel.memento-mori.site/api/deliveritem"
    public let qoimaList = "http://laravel.memento-mori.site/api/qoima/list"
    public let getUser = "http://laravel.memento-mori.site/api/userinfo"
    public let updateUser = "http://laravel.memento-mori.site/api/updateuser"
    public let getNotifications = "http://laravel.memento-mori.site/api/user/notifications"
    public let updatePassword = "http://laravel.memento-mori.site/api/changepassword"
    public let updateAddress = "http://laravel.memento-mori.site/api/changeaddress"


}
