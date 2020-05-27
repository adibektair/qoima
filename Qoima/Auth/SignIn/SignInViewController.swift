//
//  SignInViewController.swift
//  Qoima
//
//  Created by root user on 5/9/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit
import EasyPeasy


class SignInViewController: ScrollStackController, SignInViewProtocol {
    var presenter: SignInPresenterProtocol?
    var emailTextField = UITextField()
    var passwordTextField = UITextField()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeNCTranslucent()
        self.setViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    func setViews(){
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 20, distribution: .fill)
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "toplogo")
        imageView.contentMode = .scaleAspectFit
        let imageV = UIView()
        imageV.addSubview(imageView)
        self.stackView.addArrangedSubview(imageView)
        imageView.easy.layout(Height(54), Left(50), Right(50))
        emailTextField.placeholder = "Ваш e-mail"
        emailTextField.borderStyle = .roundedRect
        emailTextField.backgroundColor = .white
        emailTextField.keyboardType = .emailAddress
        passwordTextField.placeholder = "Ваш пароль"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.backgroundColor = .white
        passwordTextField.isSecureTextEntry = true
        let label = UILabel()
        label.text = "Войти"
        label.textColor = .white
        label.textAlignment = .center
        self.stackView.addArrangedSubview(label)
        
        self.stackView.addArrangedSubview(emailTextField)
        self.stackView.addArrangedSubview(passwordTextField)
        let signInButton = Button()
        signInButton.type = .dark
        signInButton.title = "Войти"
        signInButton.button.addTarget(self, action: #selector(self.signIn), for: .touchUpInside)
        self.stackView.addArrangedSubview(signInButton)
    }
    
    @objc func signIn(){
        let model = SignUpRequestModel()
        model.email = self.emailTextField.text
        model.password = passwordTextField.text
        if model.signInValidate(){
            self.presenter?.signInRequest(model: model)
        }else{
            self.showAlert(title: "Внимание", message: "Заполните все поля")
        }
    }
    
    func errorOccured(text: String) {
        self.showAlert(title: text, message: "")
    }
    func goToTab() {
        let tab = TabBarViewController()
        tab.modalPresentationStyle = .fullScreen
        self.present(tab, animated: true, completion: nil)
    }
   

}
