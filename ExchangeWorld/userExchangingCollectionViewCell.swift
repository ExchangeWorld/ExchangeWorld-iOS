//
//  userExchangingCollectionViewCell.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/9.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class userExchangingCollectionViewCell: UICollectionViewCell {
    //let viewcontroller = userExchangingViewController()
    
    @IBOutlet weak var userExchangingOwnerView: UIView!
    
    @IBOutlet weak var userExchangingOtherView: UIView!
    @IBOutlet weak var userExchangingOtherObjImageView: UIImageView!
    
    @IBOutlet weak var userExchangingOwnerObjImageView: UIImageView!
    
    @IBOutlet weak var userExchangingOwnerCategoryIcon: UIImageView!
    @IBOutlet weak var userExchangingOwnerCategoryLabel: UILabel!
    
    @IBOutlet weak var userExchangingOwnerNameLabel: UILabel!
    @IBOutlet weak var userExchangingOwnerObjLabel: UILabel!
    
    @IBOutlet weak var userExchangingOwnerDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var userExchangingOtherCategoryIcon: UIImageView!
    @IBOutlet weak var userExchangingOtherCategoryLabel: UILabel!
    @IBOutlet weak var userExchangingOtherNameLabel: UILabel!
    
    @IBOutlet weak var userExchangingOtherObjNameLabel: UILabel!
    
    @IBOutlet weak var userExchangingOtherDescriptionLabel: UILabel!
    
    @IBOutlet weak var userExchangingExchIDLabel: UILabel!
    
    
    @IBOutlet weak var userExchangeButton: UIButton!

    @IBAction func userExchangeButtonAction(_ sender: Any) {
        httpPut(URL: "\(Constants.API_SERVER_URL)/api/exchange/agree?eid=\(userExchangingExchIDLabel.text!)&owner_uid=\(Constants.uid)&token=\(Constants.exwdToken)")
        //viewcontroller.userExchangeButton(sender)
        
        
    }
    
    @IBOutlet weak var userExchangeDropButton: UIButton!
    
    @IBAction func userExchangeDropAction(_ sender: Any) {
        print("Drop")
        httpPut(URL: "\(Constants.API_SERVER_URL)/api/exchange/drop?eid=\(userExchangingExchIDLabel.text!)&token=\(Constants.exwdToken)")
        
    }
    
    
}
