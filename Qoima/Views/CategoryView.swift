//
//  CategoryView.swift
//  Qoima
//
//  Created by root user on 5/11/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy
import DropDown

enum ItemParamType {
    case text
    case dropDown
    case photo
}

class ItemView: UIView {
    
    var title : String?{
        didSet{
            self.titleLabel.text = title
        }
    }
    var keyboardType : UIKeyboardType?{
        didSet{
            self.textField.keyboardType = keyboardType ?? UIKeyboardType.default

        }
    }
    var array = [String]()
    var stackView = UIStackView()
    var titleLabel = UILabel()
    var photoButton = UIButton()
    var textField = UITextField()
    var type : ItemParamType?{
        didSet{
            switch type {
            case .text:
                self.setTextView()
            case .dropDown:
                self.setDropDownView()
            default:
                self.setPhotoView()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setViews()
        
    }
    
    func setViews(){
        self.addSubview(stackView)
        stackView.easy.layout(Edges(10))
        self.stackView.setProperties(axis: .horizontal, alignment: .fill, spacing: 10, distribution: .fill)
        self.stackView.addArrangedSubview(titleLabel)
    }
    
    func setTextView(){
        self.stackView.addArrangedSubview(textField)
        textField.borderStyle = .roundedRect
        textField.easy.layout(Height(25), Width(100))
    }
    
    func setDropDownView(){
        self.photoButton.setImage(#imageLiteral(resourceName: "Back"), for: .normal)
        self.stackView.addArrangedSubview(photoButton)
        photoButton.easy.layout(Height(13), Width(26))
    }
    
    func setPhotoView(){
        self.photoButton.setImage(#imageLiteral(resourceName: "Camera Icon"), for: .normal)
        self.stackView.addArrangedSubview(photoButton)
        photoButton.easy.layout(Height(24), Width(32))
        
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
