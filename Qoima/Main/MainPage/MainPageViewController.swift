//
//  MainPageViewController.swift
//  Qoima
//
//  Created by root user on 5/10/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit
import EasyPeasy

class MainPageViewController: ScrollStackController, MainPageViewPresenter {
    var presenter: MainPagePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setViews()
    }

    
    func setViews(){
        let image = #imageLiteral(resourceName: "toplogo-2")
        let imageV = UIImageView(frame: CGRect(x: 0, y: 5, width: 38, height: 20))
        imageV.contentMode = .scaleAspectFit
        imageV.image = image
        navigationItem.titleView = imageV
        
        
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 20, distribution: .fill)
        self.stackView.addArrangedSubview(UIView())
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "room-2")
        let imageVs = UIView()
        imageVs.addSubview(imageView)
        self.stackView.addArrangedSubview(imageView)
        imageView.easy.layout(Height(54), Left(10), Right(10))
        imageView.contentMode = .scaleAspectFill
        self.stackView.addArrangedSubview(UIView())
        self.stackView.addArrangedSubview(UIView())
        self.stackView.addArrangedSubview(UIView())

        let label = UILabel()
        label.text = "Забронировать"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.2862745098, green: 0.6196078431, blue: 0.6823529412, alpha: 1)
        
        self.stackView.addArrangedSubview(label)
        self.addLine()
        let label1 = UILabel()
        label1.text = "Добавьте новый предмет для хранения"
        label1.textAlignment = .center
        label1.numberOfLines = 0
        label1.font = label.font.withSize(14)
        label1.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        self.stackView.addArrangedSubview(label1)
        self.addLine()
        
        let button = Button()
        button.type = .dark
        button.title = "Добавить"
        self.stackView.addArrangedSubview(button)
        button.button.addTarget(self, action: #selector(self.goToAdd), for: .touchUpInside)

    }
    @objc func goToAdd(){
        self.presenter?.goToAddItem()
    }
}
