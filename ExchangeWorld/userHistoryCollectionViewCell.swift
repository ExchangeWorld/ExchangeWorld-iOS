//
//  userHistoryCollectionViewCell.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/8.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class userHistoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userOwnerObjImageView: UIImageView!
    @IBOutlet weak var userOtherObjImageView: UIImageView!
    @IBOutlet weak var userOwnerIcon: UIImageView!
    @IBOutlet weak var userOwnerCategoryIcon: UIImageView!
    @IBOutlet weak var historyExchIcon: UIImageView!
    @IBOutlet weak var userOwnerNameLabel: UILabel!
    @IBOutlet weak var userOwnerCategoryLabel: UILabel!
    @IBOutlet weak var userOtherIcon: UIImageView!
    @IBOutlet weak var userOtherCategoryIcon: UIImageView!
    @IBOutlet weak var userOtherNameLabel: UILabel!
    @IBOutlet weak var userOtherCategoryLabel: UILabel!
    
    @IBAction func ownerObjectInfoButton(_ sender: Any) {
        Constants.objCount = userOwnerObjImageView.tag
        Constants.whichCase = "HistoryOwner"
    }
    
    @IBAction func otherObjectInfoButton(_ sender: Any) {
        Constants.objCount = userOtherObjImageView.tag
        Constants.whichCase = "HistoryOther"
    }
}
