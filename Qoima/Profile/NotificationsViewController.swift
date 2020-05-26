//
//  NotificationsViewController.swift
//  Qoima
//
//  Created by root user on 5/25/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = [Notifications]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
        NetworkLayer.shared().getNotifications { (notificationResponse) in
            if notificationResponse != nil{
                self.list = notificationResponse!.notifications ?? []
                self.tableView.reloadData()
            }
        }
        self.title = "Уведомления"
        tableView.backgroundColor = #colorLiteral(red: 0.7503243089, green: 0.8837876916, blue: 0.8831787705, alpha: 1)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
      
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 14
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        cell.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        cell.titleLabel.text = list[indexPath.section].text!
        cell.cornerRadius(radius: 15, width: 0)
        return cell
    }
      
    
    
    static func open(vc: UIViewController) {
           
           let viewController = NotificationsViewController()
           if let nav = vc.navigationController {
                nav.pushViewController(viewController, animated: true)
           }
       }
}
