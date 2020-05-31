//
//  SingleItemViewController.swift
//  Qoima
//
//  Created by root user on 5/16/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit
import EasyPeasy
import SDWebImage

class SingleItemViewController: ScrollStackController {

    var item : Items?
    let button = Button()
    let datePicker = UIDatePicker()
    var dateString = String()
    var id = 0
    var status = 0
    
    override func viewWillAppear(_ animated: Bool) {
        self.setViews()
        self.view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 0.9764705882, alpha: 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackButton()
    }
    
    func setViews(){
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        let imgView = UIImageView()
        let v = UIView()
        imgView.sd_setImage(with: URL(string: "http://laravel.memento-mori.site/" + self.item!.photo!), completed: nil)
        v.addSubview(imgView)
        self.stackView.addArrangedSubview(v)
        imgView.easy.layout(Edges(5), Height(250))
        imgView.contentMode = .scaleAspectFit
        let nameView = UIView()
        nameView.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.262745098, blue: 0.337254902, alpha: 1)
        nameView.cornerRadius(radius: 10, width: 0)
        let nameLabel = UILabel()
        nameLabel.text = item!.name!
        nameLabel.textColor = .white
        nameView.addSubview(nameLabel)
        nameLabel.easy.layout(Edges(5))
        self.stackView.addArrangedSubview(nameView)
        nameView.easy.layout(Height(40))
        addLine()

        let statusLabel = UILabel()
        
        if let status = item?.status{
            switch status {
            case 0:
                statusLabel.text = "Cтатус: Новый"
                button.title = "Запланировать хранение"
                button.button.tag = item!.id!
                button.button.addTarget(self, action: #selector(self.planItem(_:)), for: .touchUpInside)
                self.status = 1
//                cell.actionButton.setTitle("Запланировать хранение", for: .normal)
            case 1:
                statusLabel.text = "Cтатус: На складе"
                button.title = "Заказать доставку"
                button.button.tag = item!.id!
                button.button.addTarget(self, action: #selector(self.deliverItem(_:)), for: .touchUpInside)
                self.status = 2
//                cell.actionButton.setTitle("Заказать доставку", for: .normal)
            case 2:
                button.button.isHidden = true
                statusLabel.text = "Cтатус: В пути"
            case 3:
                button.button.isHidden = true

                statusLabel.text = "Cтатус: В пути"
            default:
                button.button.isHidden = true

                statusLabel.text = "Cтатус: Ошибка"
            }
            self.stackView.addArrangedSubview(statusLabel)
        }
        addLine()

        let label = UILabel()
        label.text = "Количество: \(item!.amount!)"
        self.stackView.addArrangedSubview(label)
        addLine()
        let label1 = UILabel()
        label1.text = "Цена: \(item!.price!)"
        self.stackView.addArrangedSubview(label1)
        
        button.type = .dark
        self.stackView.addArrangedSubview(button)
    }
    
    @objc func planItem(_ sender : UIButton){
        let id = sender.tag
        self.id = id
        self.showDatePicker()
    }
    
    @objc func deliverItem(_ sender : UIButton){
           let id = sender.tag
           self.id = id
           self.showDatePicker()
           
       }
    
    static func open(vc: UIViewController, item : Items) {
        
        let viewController = SingleItemViewController()
        viewController.item = item
        if let nav = vc.navigationController {
             nav.pushViewController(viewController, animated: true)
        }
    }

    func showDatePicker(){
       //Formate Date
       datePicker.datePickerMode = .dateAndTime

      //ToolBar
      let toolbar = UIToolbar();
      toolbar.sizeToFit()
      let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
     let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

    toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        self.view.addSubview(dark)
        dark.easy.layout(Edges())
        dark.addSubview(datePicker)
        datePicker.easy.layout(Center())
        dark.addSubview(toolbar)
        
        toolbar.easy.layout(Bottom(0).to(datePicker), Width().like(datePicker), Height(50), CenterX())
        toolbar.backgroundColor = .white
        datePicker.backgroundColor = .white
    }

     @objc func donedatePicker(){
  

        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        self.dateString = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        if status == 1{
            NetworkLayer.shared().planItem(id: self.id, date: dateString) { (response) in
                  if response?.success ?? false{
                      self.showAlert(title: "Внимание", message: "Новый предмет добавлен успешно", popToRoot: true)
                    self.navigationController?.popViewController(animated: true)
                  }else{
                      self.showAlert(title: "Внимание", message: "ошибка")
                  }
              }
        }else if status == 2{
            NetworkLayer.shared().deliverItem(id: id, date: dateString) { (response) in
                       if response?.success ?? false{
                           self.showAlert(title: "Внимание", message: "Новый предмет добавлен успешно", popToRoot: true)
                        self.navigationController?.popViewController(animated: true)
                       }else{
                           self.showAlert(title: "Внимание", message: "ошибка")
                       }
                }
        }
        
       
    }

    @objc func cancelDatePicker(){
        dark.removeFromSuperview()
       
     }
    
}
