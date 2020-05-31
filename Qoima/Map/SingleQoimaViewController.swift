//
//  SingleQoimaViewController.swift
//  Qoima
//
//  Created by Таир Адибек on 5/31/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit

class SingleQoimaViewController: UIViewController {

    var item : Qoima?
       
       
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = item?.name
        addressLabel.text = item?.address
        websiteLabel.text = item?.phone
    }
    
    
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    @IBAction func website(_ sender: Any) {
        guard let url = URL(string: item!.urlAddress!) else { return }
        UIApplication.shared.open(url)
    }
    @IBAction func call(_ sender: Any) {
        if let url = NSURL(string: "tel://\(item!.phone!)"), UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.open(url as URL)
        }
    }
    
    static func open(vc: UIViewController, item : Qoima) {
           
           let viewController = SingleQoimaViewController()
           viewController.item = item
           if let nav = vc.navigationController {
                nav.pushViewController(viewController, animated: true)
           }
       }
}
