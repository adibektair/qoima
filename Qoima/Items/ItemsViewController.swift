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
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemCollectionViewCell")
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
        
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }


}
