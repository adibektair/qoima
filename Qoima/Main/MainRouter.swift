//
//  MainRouter.swift
//  Qoima
//
//  Created by root user on 5/10/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import UIKit

protocol MainRouterProtocol {
    var navigationController : UINavigationController? { get set }
    var authBuilder : MainBuilderProtocol? { get set }
    init(navController : UINavigationController, builder : MainBuilderProtocol)
    func initialViewController()
    func goToAddItem()
}

class MainRouter: MainRouterProtocol {
    var navigationController: UINavigationController?
    
    var authBuilder: MainBuilderProtocol?
    
    required init(navController: UINavigationController, builder: MainBuilderProtocol) {
        self.navigationController = navController
        self.authBuilder = builder
    }
    
    func initialViewController() {
        if let navigationController = navigationController{
            guard let mainViewController = authBuilder?.createMain(router: self) else {
                return
            }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func goToAddItem(){
        if let navigationController = navigationController{
            guard let mainViewController = authBuilder?.createAddItem(router: self) else {
                return
            }
            navigationController.pushViewController(mainViewController, animated: true)
        }
        
    }
}
