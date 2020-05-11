//
//  AuthBuilder.swift
//  Qoima
//
//  Created by root user on 5/8/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import UIKit
protocol AuthBuilderProtocol {
    func createAuth(router : AuthRouter) -> UIViewController
    func createSignUp(router : AuthRouter) -> UIViewController
    func createSignIn() -> UIViewController
}
class AuthBuilder: AuthBuilderProtocol {
    func createAuth(router: AuthRouter) -> UIViewController {
        let view = WelcomeViewController()
        let presenter = WelcomePresenter(router: router, view: view)
        view.presenter = presenter
        return view
    }
    
    func createSignUp(router : AuthRouter) -> UIViewController{
        let view = SignUpViewController()
        let presenter = SignUpPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }

    func createSignIn() -> UIViewController{
        let view = SignInViewController()
        let presenter = SignInPresenter(view: view)
        view.presenter = presenter
        return view
    }

    
}
