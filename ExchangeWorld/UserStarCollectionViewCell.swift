//
//  UserStarCollectionViewCell.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/5.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class UserStarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userStarImageView: UIImageView!
    @IBOutlet weak var userStarObjNameLabel: UILabel!
    @IBOutlet weak var userStarCategoryNameLabel: UILabel!
    @IBOutlet weak var userStarOwnerNameLabel: UILabel!
    @IBOutlet weak var userStarCategoryIcon: UIImageView!
    @IBAction func ObjDetailButtonAction(_ sender: Any) {
        Constants.objCount = userStarImageView.tag
        Constants.whichCase = "userStar"
    }
}
