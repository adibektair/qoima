//
//  ItemsViewController.swift
//  Qoima
//
//  Created by root user on 5/11/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit
import SDWebImage

class ItemsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var items = [Items]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.getData()
    }
    override func viewDidLoad() {
        let image = #imageLiteral(resourceName: "toplogo-2")
        let imageV = UIImageView(frame: CGRect(x: 0, y: 5, width: 38, height: 20))
        imageV.contentMode = .scaleAspectFit
        imageV.image = image
        navigationItem.titleView = imageV
        
        self.view.backgroundColor = .white
        self.collectionView.backgroundColor = #colorLiteral(red: 0.8588235294, green: 0.8588235294, blue: 0.8588235294, alpha: 1)
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemCollectionViewCell")
      
    }
    
    func getData(){
        let arr = ["unique" : Helper.shared().getToken(), "id" : Helper.shared().getValue(byKey: "id")] as [String : AnyObject]
              NetworkLayer.shared().getItems(params: arr) { (resp) in
                  self.items = resp!.items!
                  self.collectionView.reloadData()
              }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        let i = items[indexPath.row]
        cell.logoImageView.sd_setImage(with: URL(string: "http://laravel.memento-mori.site/" + items[indexPath.row].photo!), completed: nil)
        cell.nameLabel.text = i.name!
        cell.amountLabel.text = "Amount: \(i.amount!)"
        cell.cornerRadius(radius: 10, width: 0)

        //  0 = default(now created), 1 = in qoima, 2 = in the way to qoima, 3 = in the way to home, 10 = error
        
        if let status = i.status{
            switch status {
            case 0:
                cell.statusLabel.text = "Новый"
                cell.actionButton.tag = i.id!
                cell.actionButton.addTarget(self, action: #selector(self.planItem(_:)), for: .touchUpInside)
                cell.actionButton.setTitle("Запланировать хранение", for: .normal)
            case 1:
                cell.statusLabel.text = "На складе"
                cell.actionButton.tag = i.id!
                cell.actionButton.addTarget(self, action: #selector(self.deliverItem(_:)), for: .touchUpInside)
                cell.actionButton.setTitle("Заказать доставку", for: .normal)
            case 2:
                cell.actionButton.isHidden = true
                cell.statusLabel.text = "В пути"
            case 3:
                cell.actionButton.isHidden = true
                cell.statusLabel.text = "В пути"
            default:
                cell.actionButton.isHidden = true
                cell.statusLabel.text = "Ошибка"
            }
        }
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    @objc func planItem(_ sender : UIButton){
        let id = sender.tag
        NetworkLayer.shared().planItem(id: id) { (response) in
            if response?.success ?? false{
                self.getData()
                self.showAlert(title: "Внимание", message: "Новый предмет добавлен успешно")
            }else{
                self.showAlert(title: "Внимание", message: "ошибка")
            }
        }
    }
    
    @objc func deliverItem(_ sender : UIButton){
           let id = sender.tag
           NetworkLayer.shared().deliverItem(id: id) { (response) in
               if response?.success ?? false{
                   self.getData()
                   self.showAlert(title: "Внимание", message: "Новый предмет добавлен успешно")
               }else{
                   self.showAlert(title: "Внимание", message: "ошибка")
               }
           }
       }

}
extension ItemsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.frame.size.width / 2 - 5
        return CGSize(width: w, height: w * 1.5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let i = items[indexPath.row]
        SingleItemViewController.open(vc: self, item: i)
    }
}
