//
//  Helper.swift
//  Qoima
//
//  Created by root user on 5/9/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import UIKit

class Helper : UserDefaults {
    
    private static var sharedReference : Helper{
          let headers = Helper()
          return headers
    }
    
    class func shared() -> Helper {
          return sharedReference
    }
    func save(forKey : String, value : String){
        UserDefaults.standard.set(value, forKey: forKey)
    }
     func getValue(byKey: String) -> String?{
        return UserDefaults.standard.string(forKey: byKey)
    }
    func saveToken(token : String){
          self.save(forKey: "token", value: token)
      }
      
    func getToken() -> String{
        guard let token = self.getValue(byKey: "token") else {
            return ""
        }
          
        return token
    }

    
}
