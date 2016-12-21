//
//  QueueCollectionViewCell.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class QueueCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var wait4ExchObjImageView: UIImageView!
    @IBOutlet weak var wait4ExchObjNameLabel: UILabel!
    @IBOutlet weak var wait4ExchObjCategoryIcon: UIImageView!
    @IBOutlet weak var wait4ExchObjCategoryNameLabel: UILabel!
    @IBOutlet weak var wait4ExchObjOwnerNameLabel: UILabel!
    @IBOutlet weak var queueButton: UIButton!
    @IBAction func queueButtonAction(_ sender: Any) {
        Constants.ownObject2QueueCount = queueButton.tag
        print(Constants.gidToBeQueued)
        print(queueButton.tag)
        print(Constants.userWait4ExchGIDArray[queueButton.tag])
        httpPost(URL: "\(Constants.API_SERVER_URL)/api/queue/post?token=\(Constants.exwdToken)", parameters: ["host_goods_gid": Constants.gidToBeQueued, "queuer_goods_gid": Constants.userWait4ExchGIDArray[queueButton.tag]], returnJsonFormat: true)
    }
}
