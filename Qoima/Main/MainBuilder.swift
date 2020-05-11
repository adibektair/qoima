//
//  MainBuilder.swift
//  Qoima
//
//  Created by root user on 5/10/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import UIKit
protocol MainBuilderProtocol {
    func createMain(router : MainRouter) -> UIViewController
    func createAddItem(router: MainRouter) -> UIViewController
}
class MainBuilder: MainBuilderProtocol {
    func createMain(router: MainRouter) -> UIViewController {
        let view = MainPageViewController()
        let presenter = MainPagePresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    func createAddItem(router: MainRouter) -> UIViewController{
        let view = AddItemViewController()
        let presenter = AddItemPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
}
