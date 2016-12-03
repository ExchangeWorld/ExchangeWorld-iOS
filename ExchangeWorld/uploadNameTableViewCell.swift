//
//  uploadNameTableViewCell.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class uploadNameTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var uploadNameTitleLabel: UILabel!
    @IBOutlet weak var uploadNameTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        uploadNameTitleLabel.text = "3333"
        uploadNameTitleLabel.textColor = UIColor(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        uploadNameTextField.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        uploadNameTextField.textColor = UIColor.black
        uploadNameTextField.delegate = self
        textFieldShouldReturn(textField: uploadNameTextField)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
}

//extension uploadNameTableViewCell{
//    func getDataAfterUserInput()  {
//        print(uploadNameTextField.text!)
//    }
//}
