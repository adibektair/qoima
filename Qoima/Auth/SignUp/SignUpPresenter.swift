//
//  SignUpPresenter.swift
//  Qoima
//
//  Created by root user on 5/9/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import UIKit

protocol SignUpPresenterProtocol {
    var view : SignUpViewProtocol? { get set }
    var router : AuthRouterProtocol? { get set }
    init(view : SignUpViewProtocol, router: AuthRouterProtocol)
    func signUpRequest(model : SignUpRequestModel)
    
    
}
protocol SignUpViewProtocol : ScrollStackController {
    var presenter : SignUpPresenterProtocol? { get set }
    func errorOccured(text: String)
    func goToTab()
}
class SignUpPresenter: SignUpPresenterProtocol {
    var view: SignUpViewProtocol?
    
    var router: AuthRouterProtocol?
    
    required init(view: SignUpViewProtocol, router: AuthRouterProtocol) {
        self.router = router
        self.view = view
    }
    
    func signUpRequest(model: SignUpRequestModel) {
        self.view?.startLoading()
        NetworkLayer.shared().register(params: model.getJson()) { (response) in
            self.view?.stopLoading()
            guard let resp = response else{
                self.view?.errorOccured(text: "Произошла ошибка")
                return
            }
            if resp.success ?? false{
                Helper.shared().saveToken(token: resp.user!.unique!)
                Helper.shared().save(forKey: "id", value: String(resp.user!.id!))
                self.view?.goToTab()

            }else{
                self.view?.errorOccured(text: "Произошла ошибка")
            }
        }
    }
    
    
}
