//
//  PhotoCell.swift
//  InstagramProject
//
//  Created by FLee on 9/27/15.
//  Copyright © 2015 Fred Lee. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {


    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    var media: InstagramOrganization.Media? {
        didSet {
            if let setMedia = media {
                info.text = setMedia.caption
                likes.text = "❤️ " + String(setMedia.likes) + " likes"
                if let url = NSURL(string: setMedia.mediaURL) {
                    if let data = NSData(contentsOfURL: url) {
                        if let avatarSquare = UIImage(data:data) {
                            photo.image = avatarSquare
                        }
                    }
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
