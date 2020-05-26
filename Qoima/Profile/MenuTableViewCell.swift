//
//  MenuTableViewCell.swift
//  Qoima
//
//  Created by root user on 5/25/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var actionButton: UIButton!{
        didSet{
            actionButton.cornerRadius(radius: 10, width: 1, color: .black)
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
