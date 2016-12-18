//
//  ObjectInfoFromProfileViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class ObjectInfoFromProfileViewController: UIViewController {

    @IBOutlet weak var ObjView: UIView!
    @IBOutlet weak var ObjImageView: UIImageView!
    @IBOutlet weak var ObjCategoryIcon: UIImageView!
    @IBOutlet weak var ObjNameLabel: UILabel!
    @IBOutlet weak var ObjOwnerImage: UIImageView!
    @IBOutlet weak var ObjOwnerName: UILabel!
    @IBOutlet weak var ObjDescriptionTextView: UITextView!
    @IBOutlet weak var ObjFollowButton: UIButton!
    @IBOutlet weak var ObjQueueButton: UIButton!
    
    var whichCase : String = Constants.whichCase
    var objCount : Int = Constants.objCount
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ObjView.ViewBorderFunction(HorW: false, clear: true, amount: 50, borderWidth: 1)
        ObjImageView.ViewBorderFunction(HorW: false, clear: false, amount: 20, borderWidth: 1)
        ObjOwnerImage.ViewBorderFunction(HorW: false, clear: true, amount: 20, borderWidth: 1)
        
        switch whichCase {
        case "userStar":
            print("it's userStar")
            
            ObjImageView.sd_setImage(with: URL(string: Constants.userStarImageURLArrayP[objCount]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjCategoryIcon.image = UIImage(named: Constants.userStarCategotyArray[objCount])
            ObjNameLabel.text = Constants.userStarObjNameArray[objCount]
            ObjOwnerImage.sd_setImage(with: URL(string: Constants.userStarOwnerImageURLArray[objCount]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjOwnerName.text = Constants.userStarOwnerNameArray[objCount]
            
            
            break
        case "wait4Exch":
            print("it's wait4Exch")
            break
        default:
            print("not work")
        }

    }

    @IBAction func dissmissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func followButtonAction(_ sender: Any) {
        if(ObjFollowButton.imageView!.image == UIImage(named: "關注_01")){
            ObjFollowButton.setImage(UIImage(named: "關注_02"), for: .normal)
        }else{
            ObjFollowButton.setImage(UIImage(named: "關注_01"), for: .normal)
        }
    }
    
    @IBAction func queueButtonAction(_ sender: Any) {
        if(ObjQueueButton.imageView!.image == UIImage(named: "排_01")){
            ObjQueueButton.setImage(UIImage(named: "排_02"), for: .normal)
        }else{
            ObjQueueButton.setImage(UIImage(named: "排_01"), for: .normal)
        }
    }
    
    

    

}
