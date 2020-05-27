//
//  ProfileViewController.swift
//  Qoima
//
//  Created by root user on 5/25/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabelView: UITableView!
    

    var user : User?
    let images : [UIImage] = [#imageLiteral(resourceName: "prof logo"), #imageLiteral(resourceName: "Icon"), #imageLiteral(resourceName: "Archive Icon (Stroke)"), #imageLiteral(resourceName: "Shape")]
    let titles = ["Profile", "Notifications", "Items", "Settings"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = #imageLiteral(resourceName: "toplogo-2")
        let imageV = UIImageView(frame: CGRect(x: 0, y: 5, width: 38, height: 20))
        imageV.contentMode = .scaleAspectFit
        imageV.image = image
        navigationItem.titleView = imageV
        
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        tabelView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
        self.startLoad()
        self.tabelView.allowsSelection = false
        self.tabelView.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SignOut", style: .plain, target: self, action: #selector(btnShare_clicked))

    }
    
    
    
    @objc func btnShare_clicked() {
        let alert = UIAlertController(title: "Sign out", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
           let navigationController = UINavigationController()
           navigationController.navigationBar.isTranslucent = true
            let builder = AuthBuilder()
            let router = AuthRouter(navController: navigationController, builder: builder)
            let mainViewController = builder.createAuth(router: router)
            navigationController.viewControllers = [mainViewController]
            navigationController.modalPresentationStyle = .fullScreen
            Helper.shared().clear()
            self.present(navigationController, animated: true, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: { action in
           
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NetworkLayer.shared().getUser { (response) in
            self.stopLoad()
            if response!.user != nil{
                self.user = response!.user!
                self.tabelView.reloadData()
            }
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100
        }else{
            return 70
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i = indexPath.row - 1
        if indexPath.row == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            cell.backgroundColor = .white
            if user != nil{
                cell.nameLabel.text = "Name: " + self.user!.name! + " " + self.user!.surname!
                cell.phoneLabel.text = "e-mail: " + self.user!.email!
                cell.extraLabel.text = ""
            }
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        switch i {
        case 0:
            cell.actionButton.addTapGestureRecognizer {
                UserViewController.open(vc: self, item: self.user!)
            }
        case 1:
            cell.actionButton.addTapGestureRecognizer {
                NotificationsViewController.open(vc: self)
            }
        case 2:
            cell.actionButton.addTapGestureRecognizer {
                self.tabBarController?.selectedIndex = 1
            }
        case 3:
            cell.actionButton.addTapGestureRecognizer {
                SettingsViewController.open(vc: self, user: self.user!)
            }
        default:
            cell.actionButton.addTapGestureRecognizer {
                UserViewController.open(vc: self, item: self.user!)

            }
        }
        
        cell.backgroundColor = .white
        cell.imgView.image = images[i]
        cell.actionButton.setTitle(titles[i], for: .normal)
        
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

}
