//
//  QoimaViewController.swift
//  Qoima
//
//  Created by root user on 5/25/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit
import EasyPeasy
class QoimaViewController: ScrollStackController {

    var item : Qoima?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    static func open(vc: UIViewController, item : Qoima) {
        
        let viewController = QoimaViewController()
        viewController.item = item
        if let nav = vc.navigationController {
             nav.pushViewController(viewController, animated: true)
        }
    }
}
