//
//  uploadCategoryTableViewCell.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class uploadCategoryTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var uploadCategoryTitleLabel: UILabel!
    @IBOutlet weak var uploadCategoryTextField: UITextField!
    
    let categories = ["書籍", "教科書", "電子產品", "3C配件", "服飾", "化妝品", "飾品", "食物", "家庭用品", "體育用品", "電玩遊戲", "其他"]
    let picker = UIPickerView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        uploadCategoryTitleLabel.textColor = UIColor(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        uploadCategoryTextField.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        
        picker.delegate = self
        picker.dataSource = self
        uploadCategoryTextField.inputView = picker
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        uploadCategoryTextField.text = categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
}
