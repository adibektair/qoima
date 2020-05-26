//
//  AddItemViewController.swift
//  Qoima
//
//  Created by root user on 5/11/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit
import EasyPeasy
import DropDown

class AddItemViewController: ScrollStackController, AddItemViewProtocol, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var presenter: AddItemPresenterProtocol?
    var array = [String]()
    var imagePicker = UIImagePickerController()
    var myImage = UIImage()
    var imageView = UIImageView()
    var catId = Int()
    
    func succeeded() {
        self.showError(text: "YEAP")
    }
    
    let dropDown = DropDown()
 
    

    override func viewDidLoad() {
        imagePicker.delegate = self
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let image = #imageLiteral(resourceName: "toplogo-2")
        let imageV = UIImageView(frame: CGRect(x: 0, y: 5, width: 38, height: 20))
        imageV.contentMode = .scaleAspectFit
        imageV.image = image
        navigationItem.titleView = imageV
              
    }
    
    func getParams(params: [Parameters]) {
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        let label = UILabel()
        label.text = "Добавить новый предмет"
        label.textColor = .black
        label.textAlignment = .center
        self.stackView.addArrangedSubview(label)
        
        for p in self.presenter!.categories!{
            self.array.append(p.name!)
        }
        
        for param in params {
            let paramView = ItemView()
            paramView.title = param.paramTitle!
            paramView.keyboardType = param.keyboardType
            if param.isPhoto ?? false{
                paramView.type = .photo
                paramView.photoButton.addTarget(self, action: #selector(self.chooseProto(_:)), for: .touchUpInside)
            }
            else if param.isDropDown ?? false{
                paramView.type = .dropDown
                dropDown.anchorView = paramView.photoButton
                paramView.photoButton.addTarget(self, action: #selector(self.showDropDown(_ :)), for: .touchUpInside)
            }
            else{
                paramView.type = .text
            }
            if !param.isFillable!{
                paramView.textField.isUserInteractionEnabled = false
            }
            self.stackView.addArrangedSubview(paramView)
            self.addLine()
        }
    }
    
    
    @objc func chooseProto(_ sender: UIButton ){
        self.pickPhoto()
        
    }
    
    @objc func showDropDown(_ sender : UIButton){

        dropDown.dataSource = array
        dropDown.show()
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            sender.setImage(nil, for: .normal)
            sender.setTitle(item, for: .normal)
            sender.setTitleColor(.black, for: .normal)
            sender.easy.layout(Width(100))
            self.catId = self.presenter!.categories![index].id!
        }
        
    }
    
    
    func pickPhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    let addButton = Button()

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        self.myImage = image
        self.stackView.addArrangedSubview(imageView)
        imageView.image = image
        imageView.easy.layout(Width(250), Height(250))
        imageView.cornerRadius(radius: 10, width: 1)
        imageView.contentMode = .scaleAspectFit
        addButton.title = "Добавить"
        addButton.type = .dark
        addButton.button.addTarget(self, action: #selector(self.upload), for: .touchUpInside)
        self.stackView.addArrangedSubview(addButton)
    }
    
    @objc func upload(){
        
        

        let model = Parameters()
        for i in self.stackView.arrangedSubviews{
            if i is ItemView{
                let iView = i as! ItemView
                switch iView.title {
                case "Название":
                    model.paramTitle = iView.textField.text
                case "Длина (см)":
                    model.lenght = Int(iView.textField.text ?? "0")
                case "Ширина (см)":
                    model.width = Int(iView.textField.text ?? "0")
                case "Высота (см)":
                    model.height = Int(iView.textField.text ?? "0")
                case "Количество":
                    model.amount = Int(iView.textField.text ?? "0")
                case "Цена":
                    model.sum = Int(iView.textField.text ?? "0")
                default:
                    model.categoryId = self.catId
                }
            }
        }
        model.photo = self.myImage
        model.categoryId = self.catId
        if !model.validate(){
            self.showError(text: "Заполните все поля")
        }
        let sum = (model.lenght! + (2 * model.width!) + (2 * model.height!)) * model.amount!
        
        let alert = UIAlertController(title: "Сумма составляет \(sum) тенге", message: "Продолжить?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
            model.sum = sum
            self.presenter?.addItemRequest(params: model, image: self.myImage)
        }))
        
        alert.addAction(UIAlertAction(title: "Нет", style: .destructive, handler: { action in
           return
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
