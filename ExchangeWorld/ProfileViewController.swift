//
//  ProfileViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/11/20.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userProfilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("----------------")
        print(Constants.facebookID)
        print(Constants.facebookProfilePic)
        print("----------------")
        
        //userProfilePic = Constants.facebookProfilePic as UIImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
