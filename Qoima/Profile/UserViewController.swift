//
//  UserViewController.swift
//  Qoima
//
//  Created by root user on 5/25/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    
    var user : User?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!{
        didSet{
            submitButton.setTitle("Сохранить изменения", for: .normal)
            submitButton.cornerRadius(radius: 10, width: 1, color: .black)
        }
    }
    @IBAction func submitClicked(_ sender: Any) {
        if nameTextField.text == "" || surnameTextField.text == "" || descriptionTextField.text == ""{
            self.showAlert(title: "Ошибка", message: "Заполните все поля")
            return
        }
        let json = ["id" : Helper.shared().getValue(byKey: "id"), "unique" : Helper.shared().getToken(),
                    "name" : nameTextField.text!, "surname" : surnameTextField.text!, "description" : descriptionTextField.text!] as [String : AnyObject]
        self.startLoad()
        NetworkLayer.shared().updateUser(params: json) { (loginResponse) in
            self.stopLoad()
            self.showAlert(title: "Успешно!", message: "Ваши данные обновлены")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.text = user?.name
        self.surnameTextField.text = user?.surname
        self.descriptionTextField.text = user?.descriptionField
        // Do any additional setup after loading the view.
    }
    
    static func open(vc: UIViewController, item : User) {
           
           let viewController = UserViewController()
           viewController.user = item
           if let nav = vc.navigationController {
                nav.pushViewController(viewController, animated: true)
           }
       }

}
