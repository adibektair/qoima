//
//  AppDelegate.swift
//  Tensend(new)
//
//  Created by root user on 1/29/20.
//  Copyright © 2020 adibek. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        window = UIWindow(frame: UIScreen.main.bounds)
//        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)
        let navigationController = UINavigationController()
////        navigationController.navigationBar.isTranslucent = true
//       
//        let builder =  AuthBuilder()
//        let router = AuthRouter(navController: navigationController, builder: builder)
//        router.initialViewController()
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
//                   
//            
        return true
    }
    

}
