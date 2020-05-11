//
//  WelcomeViewController.swift
//  Qoima
//
//  Created by root user on 5/8/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit
import ImageSlideshow
import EasyPeasy

class WelcomeViewController: ScrollStackController, WelcomeViewProtocol {

    var slideshow = ImageSlideshow()
    var presenter: WelcomePresenterProtocol?
    var titleLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.slideshow.delegate = self
        self.setViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setViews(){
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 20, distribution: .fill)
        let v = UIView()
        self.stackView.addArrangedSubview(v)
        v.easy.layout(Height(30))
        self.stackView.addArrangedSubview(slideshow)
        slideshow.easy.layout(Height(220))
        self.stackView.addArrangedSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        let registerButton = Button()
        registerButton.type = .white
        registerButton.title = "НАЧАТЬ"
        registerButton.button.addTarget(self, action: #selector(self.registerClicked), for: .touchUpInside)
        self.stackView.addArrangedSubview(registerButton)
        
        let loginButton = Button()
        loginButton.type = .dark
        loginButton.title = "ВОЙТИ"
        loginButton.button.addTarget(self, action: #selector(self.loginClicked), for: .touchUpInside)
        self.stackView.addArrangedSubview(loginButton)

    }
    
    @objc func registerClicked(){
        self.presenter?.registerPressed()
    }
    @objc func loginClicked(){
        self.presenter?.signInPressed()
    }
    
    func showSlider(slider: [Slider]) {
        var arr = [ImageSource]()
        for i in slider{
            arr.append(ImageSource(image: i.image!))
        }
        self.titleLabel.text = slider[0].title!
        self.slideshow.setImageInputs(arr)
    }
    
}
extension WelcomeViewController : ImageSlideshowDelegate{
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        self.titleLabel.text = presenter?.getSlider()[page].title!
    }
}
