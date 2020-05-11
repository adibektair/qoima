//
//  SignUpViewController.swift
//  Qoima
//
//  Created by root user on 5/9/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit
import EasyPeasy
import AKMaskField

class SignUpViewController: ScrollStackController, SignUpViewProtocol {


    var presenter: SignUpPresenterProtocol?
    var nameTextField = UITextField()
    var surnameTextField = UITextField()

    var emailTextField = UITextField()
    var phoneTextField = AKMaskField()
    var passwordTextField = UITextField()
    var repeatPasswordTextField = UITextField()
    
    
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
        let imageV = UIView()
        imageV.addSubview(imageView)
        self.stackView.addArrangedSubview(imageView)
        imageView.easy.layout(Height(54), Left(50), Right(50))
        
        nameTextField.borderStyle = .roundedRect
        nameTextField.backgroundColor = .white
        
        surnameTextField.borderStyle = .roundedRect
        surnameTextField.backgroundColor = .white
        

        
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.backgroundColor = .white
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.backgroundColor = .white
        repeatPasswordTextField.borderStyle = .roundedRect
        repeatPasswordTextField.backgroundColor = .white

        emailTextField.borderStyle = .roundedRect
        emailTextField.backgroundColor = .white
        nameTextField.placeholder = "Ваше имя"
        surnameTextField.placeholder = "Ваша фамилия"
        emailTextField.placeholder = "Ваш e-mail"
        phoneTextField.placeholder = "Ваш номер телефона"
        passwordTextField.placeholder = "Придумайте пароль"
        repeatPasswordTextField.placeholder = "Повторите пароль"
        phoneTextField.maskExpression = "+7 ({ddd}) {ddd} {dd} {dd}"

        emailTextField.keyboardType = .emailAddress
        phoneTextField.keyboardType = .numberPad
        passwordTextField.isSecureTextEntry = true
        repeatPasswordTextField.isSecureTextEntry = true
        let label = UILabel()
        label.text = "Зарегистритуйтесь чтобы начать!"
        label.textColor = .white
        label.textAlignment = .center
        self.stackView.addArrangedSubview(label)
        self.stackView.addArrangedSubview(nameTextField)
        self.stackView.addArrangedSubview(surnameTextField)
        self.stackView.addArrangedSubview(emailTextField)
        self.stackView.addArrangedSubview(phoneTextField)
        self.stackView.addArrangedSubview(passwordTextField)
        self.stackView.addArrangedSubview(repeatPasswordTextField)
        
        self.stackView.addArrangedSubview(UIView())
        let signUpButton = Button()
        signUpButton.type = .dark
        signUpButton.title = "Зарегистрироваться"
        signUpButton.button.addTarget(self, action: #selector(self.signUp), for: .touchUpInside)
        self.stackView.addArrangedSubview(signUpButton)

    }
    @objc func signUp(){
        let model = SignUpRequestModel()
        model.name = self.nameTextField.text
        model.surname = self.surnameTextField.text
        model.email = emailTextField.text
        model.phone = phoneTextField.text
        model.password = passwordTextField.text
        
        if model.validate(){
            if passwordTextField.text != repeatPasswordTextField.text {
                self.showAlert(title: "Внимание", message: "Пароли не совпадают")
                return
            }
            self.presenter?.signUpRequest(model: model)

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
