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
        let icon2 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "contacts"), selectedImage: #imageLiteral(resourceName: "contacts"))
        coursesNav.addChild(ItemsViewController())
        coursesNav.tabBarItem = icon2
        controllers.append(coursesNav)
        
        
        self.tabBar.tintColor = .white
//        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
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
