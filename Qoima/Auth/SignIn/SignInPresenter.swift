//
//  SignInPresenter.swift
//  Qoima
//
//  Created by root user on 5/9/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
protocol SignInPresenterProtocol {
    var view : SignInViewProtocol? { get set }
    init(view : SignInViewProtocol)
    func signInRequest(model : SignUpRequestModel)
}
protocol SignInViewProtocol : ScrollStackController {
    var presenter : SignInPresenterProtocol? { get set }
    func errorOccured(text: String)
    func goToTab()
}

class SignInPresenter: SignInPresenterProtocol {
    var view: SignInViewProtocol?
    
    required init(view: SignInViewProtocol) {
        self.view = view
    }
    
    func signInRequest(model : SignUpRequestModel) {
        self.view?.startLoading()

        NetworkLayer.shared().login(params: model.getSignInJson()) { (response) in
            self.view?.stopLoading()
            guard let resp = response else{
                self.view?.errorOccured(text: "Произошла ошибка")
                return
            }
            if resp.success ?? false{
                Helper.shared().saveToken(token: resp.unique!)
                Helper.shared().save(forKey: "id", value: String(resp.user!.id!))
                self.view?.goToTab()
            }else{
                self.view?.errorOccured(text: "Произошла ошибка")
            }
        }
    }
    
    
    
}
