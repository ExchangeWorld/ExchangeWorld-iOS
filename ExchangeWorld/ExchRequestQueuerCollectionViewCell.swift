//
//  ExchRequestQueuerCollectionViewCell.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/17.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class ExchRequestQueuerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userExchConfirmedButton: UIButton!
    
    @IBOutlet weak var userExchQueuerImage: UIImageView!
    @IBOutlet weak var userExchQueuerObjNameLabel: UILabel!
    @IBOutlet weak var userExchQueuerCategoryIcon: UIImageView!
    @IBOutlet weak var userExchQueuerCategoryLabel: UILabel!
    @IBOutlet weak var userExchQueuerNameLabel: UILabel!
    
    
    @IBAction func userExchConfirmButtonAction(_ sender: Any) {
        Constants.whichQueuerCount = userExchConfirmedButton.tag
        
        httpPost(URL: "\(Constants.API_SERVER_URL)/api/exchange/create?token=\(Constants.exwdToken)", parameters: ["goods_one_gid": Constants.userExchRequestOwnerGIDArray[Constants.whichObjCount] , "goods_two_gid": Constants.userExchRequestQueuerGIDArray[Constants.whichObjCount][Constants.whichQueuerCount]], returnJsonFormat : true)
        
        
    }
    @IBAction func ObjectInfoButtonAction(_ sender: Any) {
        Constants.whichQueuerCount = userExchConfirmedButton.tag
        Constants.whichCase = "Queuer's_Object"
    }
}
