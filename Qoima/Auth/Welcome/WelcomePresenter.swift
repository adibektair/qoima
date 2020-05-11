//
//  WelcomePresenter.swift
//  Qoima
//
//  Created by root user on 5/8/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
protocol WelcomePresenterProtocol {
    func registerPressed()
    func signInPressed()
    func getSlider() -> [Slider]
    init(router : AuthRouterProtocol, view: WelcomeViewProtocol)
}

protocol WelcomeViewProtocol {
    var presenter : WelcomePresenterProtocol? { get set }
    func showSlider(slider : [Slider])
}

class WelcomePresenter: WelcomePresenterProtocol {

    var view : WelcomeViewProtocol?
    var router : AuthRouterProtocol?
    
    func registerPressed() {
        self.router?.goToSignUp()
    }
    
    func signInPressed() {
        self.router?.goToSignIn()
    }
    
    required init(router: AuthRouterProtocol, view: WelcomeViewProtocol) {
        self.router = router
        self.view = view
        self.view?.showSlider(slider: self.getSlider())  
    }
    
    func getSlider() -> [Slider] {
        let array = [Slider(title: "Мы забираем.", image: #imageLiteral(resourceName: "room")), Slider(title: "Мы бережно храним.", image: #imageLiteral(resourceName: "Storage item")), Slider(title: "Мы возвращаем назад.", image: #imageLiteral(resourceName: "car & building"))]
        return array
    }
    
    func generateSlider(){
        
    }
    
}
