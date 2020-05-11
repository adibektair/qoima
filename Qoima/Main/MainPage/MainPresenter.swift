//
//  MainPresenter.swift
//  Qoima
//
//  Created by root user on 5/10/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation

protocol MainPageViewPresenter {
    var presenter : MainPagePresenterProtocol? { get set }
}
protocol MainPagePresenterProtocol {
    var view : MainPageViewPresenter? { get set }
    var router : MainRouterProtocol? { get set }
    init(view : MainPageViewPresenter, router : MainRouterProtocol)
    func goToAddItem()
}
class MainPagePresenter: MainPagePresenterProtocol {
    var view: MainPageViewPresenter?
    
    var router: MainRouterProtocol?
    
    required init(view: MainPageViewPresenter, router: MainRouterProtocol) {
        self.router = router
        self.view = view
    }
    
    func goToAddItem(){
        self.router?.goToAddItem()
    }
}
