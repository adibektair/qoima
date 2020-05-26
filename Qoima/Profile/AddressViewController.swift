//
//  AddressViewController.swift
//  Qoima
//
//  Created by root user on 5/25/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {

    @IBOutlet weak var addressTextField: UITextField!
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My address"
        self.addressTextField.text = user?.address
    }

    @IBOutlet weak var saveButton: UIButton!{
        didSet{
            self.saveButton.cornerRadius(radius: 10, width: 1, color: .black)
        }
    }
    @IBAction func saveClicked(_ sender: Any) {
        if self.addressTextField.text == nil || self.addressTextField.text == ""{
            self.showAlert(title: "Внимание", message: "Заполните все поля")
            return
        }
        let json = ["id": Helper.shared().getValue(byKey: "id") ?? "", "unique" : Helper.shared().getToken(), "new_address" : addressTextField.text!] as [String : AnyObject]
        self.startLoad()
        NetworkLayer.shared().updateAddress(params: json) { (data) in
            self.stopLoad()
            if data?.success ?? false{
                self.showAlert(title: "Успешно", message: "Адрес изменен")
                return
            }
            self.showAlert(title: "Attention", message: data?.message ?? "Something went wrong")
            return
        }
    }
   
    static func open(vc: UIViewController, user : User) {
        let viewController = self.init()
        viewController.user = user
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
    }
}
