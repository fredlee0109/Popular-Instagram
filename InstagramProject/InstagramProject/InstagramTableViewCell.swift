//
//  InstagramTableViewCell.swift
//  InstagramProject
//
//  Created by FLee on 9/27/15.
//  Copyright © 2015 Fred Lee. All rights reserved.
//

import UIKit

class InstagramTableViewCell: UITableViewCell {

    @IBOutlet weak var header_image: UIImageView!
    @IBOutlet weak var header_time: UILabel!
    @IBOutlet weak var header_username: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
