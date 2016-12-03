//
//  uploadContextTableViewCell.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/3.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class uploadContextTableViewCell: UITableViewCell {

    @IBOutlet weak var uploadContextTitleLabel: UILabel!
    @IBOutlet weak var uploadContextTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        uploadContextTitleLabel.textColor = UIColor(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        uploadContextTextView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        uploadContextTextView.textColor = UIColor.black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
