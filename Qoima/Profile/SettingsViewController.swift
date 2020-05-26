//
//  SettingsViewController.swift
//  Qoima
//
//  Created by root user on 5/25/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Настройки"
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var changePassword: UIButton!{
        didSet{
            self.changePassword.cornerRadius(radius: 10, width: 1, color: .gray)
        }
    }
    @IBOutlet weak var myAdress: UIButton!{
        didSet{
            self.myAdress.cornerRadius(radius: 10, width: 1, color: .gray)
        }
    }
    
    @IBAction func myAdressClicked(_ sender: Any) {
        AddressViewController.open(vc: self, user: user!)
    }
    @IBAction func changePasswordClicked(_ sender: Any) {
        ChangePasswordViewController.open(vc: self)
    }
 
    static func open(vc: UIViewController, user : User) {
             
        let viewController = self.init()
        viewController.user = user
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
    }
}
