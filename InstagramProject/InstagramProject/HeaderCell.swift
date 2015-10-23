//
//  HeaderCell.swift
//  InstagramProject
//
//  Created by FLee on 9/27/15.
//  Copyright © 2015 Fred Lee. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    var header: InstagramOrganization.Media? {
        didSet {
            if let setHeader = header {
                username.text = setHeader.username
                
                let doubleTime = Double(setHeader.time)
                let format = NSDateFormatter()
                format.dateFormat = "yyyy-MM-dd hh:MM:ss"
                time.text = format.stringFromDate(NSDate(timeIntervalSince1970:doubleTime))
                if let url = NSURL(string: setHeader.avatarURL) {
                    photo.setImageWithURL(url)
//                    if let data = NSData(contentsOfURL: url) {
//                        if let avatarSquare = UIImage(data:data) {
//                            photo.image = avatarSquare
//                        }
//                    }
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
