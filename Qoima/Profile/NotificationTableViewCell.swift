//
//  NotificationTableViewCell.swift
//  Qoima
//
//  Created by root user on 5/25/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.cornerRadius(radius: 10, width: 1)
        self.cornerRadius(radius: 10, width: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
