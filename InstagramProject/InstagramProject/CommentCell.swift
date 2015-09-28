//
//  CommentCell.swift
//  InstagramProject
//
//  Created by FLee on 9/27/15.
//  Copyright © 2015 Fred Lee. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var comments: UILabel!
    
    var comment: InstagramOrganization.Comment? {
        didSet {
            if let setComment = comment {
                let line = setComment.userName + ": " + setComment.text
                let attributedString = NSMutableAttributedString(string:line)
                let range = (line as NSString).rangeOfString(setComment.userName)
                attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: range)
                comments.attributedText = attributedString
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
