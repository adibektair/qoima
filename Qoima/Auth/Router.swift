//
//  Router.swift
//  Qoima
//
//  Created by root user on 5/7/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import UIKit


protocol AuthRouterProtocol {
    var navigationController : UINavigationController? { get set }
    var authBuilder : AuthBuilderProtocol? { get set }
    init(navController : UINavigationController, builder : AuthBuilderProtocol)
    func initialViewController()
    func goToSignUp()
    func goToSignIn()
}
class AuthRouter: AuthRouterProtocol {
    

    var navigationController: UINavigationController?
    var authBuilder: AuthBuilderProtocol?
   
    required init(navController: UINavigationController, builder: AuthBuilderProtocol) {
        self.navigationController = navController
        self.authBuilder = builder
    }
    
    func initialViewController() {
        if let navigationController = navigationController{
            guard let mainViewController = authBuilder?.createAuth(router: self) else {
                return
            }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func goToSignUp(){
        if let navigationController = navigationController{
            guard let mainViewController = authBuilder?.createSignUp(router: self) else {
                return
            }
        navigationController.pushViewController(mainViewController, animated: true)
        }
    }
    
    func goToSignIn(){
        if let navigationController = navigationController{
            guard let mainViewController = authBuilder?.createSignIn() else {
                return
            }
        navigationController.pushViewController(mainViewController, animated: true)
        }
    }
}
