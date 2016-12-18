//
//  ExchRequestCollectionViewCell.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/14.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class ExchRequestCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var userExchReqImageView: UIImageView!
    @IBOutlet weak var userExchReqSeeQueuerButton: UIButton!
    @IBOutlet weak var userExchReqSeeQueuerButtonView: UIView!
    
    @IBOutlet weak var userExchReqObjLabel: UILabel!
    @IBOutlet weak var userExchReqCategoryIcon: UIImageView!
    @IBOutlet weak var userExchReqCategoryLabel: UILabel!
    @IBOutlet weak var userExchReqOwnerLabel: UILabel!
    

    
    @IBAction func userExchReqSeeQueuerButtonAction(_ sender: Any) {
        Constants.whichObjCount = userExchReqSeeQueuerButton.tag
    }
    
    
}
