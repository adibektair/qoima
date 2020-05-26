//
//  ChangePasswordViewController.swift
//  Qoima
//
//  Created by root user on 5/25/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Change password"
        self.currentPasswordTextField.isSecureTextEntry = true
        self.newPasswordTextField.isSecureTextEntry = true
        self.repeatTextField.isSecureTextEntry = true
    }

    @IBOutlet weak var currentPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var repeatTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!{
        didSet{
            self.saveButton.cornerRadius(radius: 10, width: 1, color: .black)
            self.saveButton.backgroundColor = .white
        }
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        if self.newPasswordTextField.text == nil || self.newPasswordTextField.text == "" ||
        self.repeatTextField.text == nil || self.repeatTextField.text == nil ||
            self.currentPasswordTextField.text == nil || self.currentPasswordTextField.text == nil{
            self.showAlert(title: "Внимание", message: "Заполните все поля")
            return
        }
        
        if self.newPasswordTextField.text != repeatTextField.text{
            self.showAlert(title: "Внимание", message: "Пароли не совпадают")
            return
        }
        if self.newPasswordTextField.text!.count < 8 {
            self.showAlert(title: "Внимание", message: "Новый пароль должен быть длиннее 8 символов")
            return
        }
        
        let json = ["old_password" : self.currentPasswordTextField.text!, "new_password" : newPasswordTextField.text!, "id" : Helper.shared().getValue(byKey: "id") ?? "", "unique" : Helper.shared().getToken()] as [String: AnyObject]
        self.startLoad()
        NetworkLayer.shared().updatePassword(params: json) { (data) in
            self.stopLoad()
            if data?.success ?? false{
                self.showAlert(title: "Успешно", message: "Пароль изменен")
                return
            }
            self.showAlert(title: "Attention", message: data?.message ?? "Something went wrong")
            return
        }
        
        
    }
    
    static func open(vc: UIViewController) {
             
        let viewController = self.init()
        if let nav = vc.navigationController {
            nav.pushViewController(viewController, animated: true)
        }
    }
    
}
