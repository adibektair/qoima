//
//  TabBarViewController.swift
//  Qoima
//
//  Created by root user on 5/10/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var controllers = [UIViewController]()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }

        
        let meditationNavigationController = UINavigationController()
        let builder = MainBuilder()
        meditationNavigationController.navigationBar.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.1921568627, blue: 0.2235294118, alpha: 1)
        meditationNavigationController.navigationBar.barTintColor = #colorLiteral(red: 0.1411764706, green: 0.1921568627, blue: 0.2235294118, alpha: 1)

        meditationNavigationController.navigationBar.isTranslucent = false

        let router = MainRouter(navController: meditationNavigationController, builder: builder)
        router.initialViewController()
        let icon3 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "Items"), selectedImage: #imageLiteral(resourceName: "Items"))
        meditationNavigationController.tabBarItem = icon3
        controllers.append(meditationNavigationController)
        
        let coursesNav = UINavigationController()
        coursesNav.navigationBar.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.1921568627, blue: 0.2235294118, alpha: 1)
        coursesNav.navigationBar.barTintColor = #colorLiteral(red: 0.1411764706, green: 0.1921568627, blue: 0.2235294118, alpha: 1)

        coursesNav.navigationBar.isTranslucent = false
        let icon2 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "contacts"), selectedImage: #imageLiteral(resourceName: "contacts"))

        coursesNav.viewControllers.append(ItemsViewController())
        coursesNav.tabBarItem = icon2
        controllers.append(coursesNav)
        
        
        
        let mapNav = UINavigationController()
        mapNav.navigationBar.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.1921568627, blue: 0.2235294118, alpha: 1)
        mapNav.navigationBar.barTintColor = #colorLiteral(red: 0.1411764706, green: 0.1921568627, blue: 0.2235294118, alpha: 1)

        mapNav.navigationBar.isTranslucent = false
        let icon = UITabBarItem(title: "", image: #imageLiteral(resourceName: "maps-2"), selectedImage: #imageLiteral(resourceName: "maps-2"))
        mapNav.viewControllers.append(MapViewController())
        mapNav.tabBarItem = icon
        controllers.append(mapNav)
        
        
        
        let profile = UINavigationController()
        profile.navigationBar.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.1921568627, blue: 0.2235294118, alpha: 1)
        profile.navigationBar.barTintColor = #colorLiteral(red: 0.1411764706, green: 0.1921568627, blue: 0.2235294118, alpha: 1)

        profile.navigationBar.isTranslucent = false
        let icon4 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "Profile-2"), selectedImage: #imageLiteral(resourceName: "Profile-2"))
        profile.viewControllers.append(ProfileViewController())
        profile.tabBarItem = icon4
        controllers.append(profile)
        
        self.tabBar.tintColor = .white
        self.viewControllers = controllers
        self.tabBar.barTintColor = #colorLiteral(red: 0.1411764706, green: 0.1921568627, blue: 0.2235294118, alpha: 1)
        self.tabBar.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.1921568627, blue: 0.2235294118, alpha: 1)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
