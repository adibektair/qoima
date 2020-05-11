//
//  Button.swift
//  Qoima
//
//  Created by root user on 5/9/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

enum buttonType {
    case white
    case dark
}
class Button: UIView {
    
    let button = UIButton()
    var title = String(){
        didSet{
            self.button.setTitle(title, for: .normal)
        }
    }
    var type : buttonType?{
        didSet{
            switch type {
            case .dark:
                self.button.backgroundColor = #colorLiteral(red: 0.1411764706, green: 0.1921568627, blue: 0.2235294118, alpha: 1)
                self.button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
                self.button.cornerRadius(radius: 5, width: 1, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            default:
                self.button.setTitleColor(#colorLiteral(red: 0.1411764706, green: 0.1921568627, blue: 0.2235294118, alpha: 1), for: .normal)
                self.button.cornerRadius(radius: 5, width: 1, color: #colorLiteral(red: 0.1411764706, green: 0.1921568627, blue: 0.2235294118, alpha: 1))
                self.button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(button)
        button.easy.layout(Top(0), Bottom(0), Height(50), Left(45), Right(45))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
