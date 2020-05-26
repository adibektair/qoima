//
//  QoimaViewController.swift
//  Qoima
//
//  Created by root user on 5/25/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit
import EasyPeasy
class QoimaViewController: ScrollStackController {

    var item : Qoima?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViews()
    }
    
    func setViews(){
        self.stackView.setProperties(axis: .vertical, alignment: .fill, spacing: 10, distribution: .fill)
        let imgView = UIView()
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Storage item")
        imgView.addSubview(imageView)
        imageView.easy.layout(Edges(10))
        let hStackView = UIStackView()
        hStackView.setProperties(axis: .horizontal, alignment: .center, spacing: 15, distribution: .fill)
        let phoneButton = UIButton()
        phoneButton.setImage(#imageLiteral(resourceName: "Phone Button-2"), for: .normal)
        hStackView.addArrangedSubview(phoneButton)
        let phoneButton1 = UIButton()
        phoneButton1.setImage(#imageLiteral(resourceName: "Phone Button"), for: .normal)
        hStackView.addArrangedSubview(phoneButton1)
        phoneButton.easy.layout(Height(52), Width(78))
        phoneButton1.easy.layout(Height(52), Width(78))
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    static func open(vc: UIViewController, item : Qoima) {
        
        let viewController = QoimaViewController()
        viewController.item = item
        if let nav = vc.navigationController {
             nav.pushViewController(viewController, animated: true)
        }
    }
}
