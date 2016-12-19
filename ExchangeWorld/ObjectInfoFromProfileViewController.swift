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
    @IBOutlet weak var ObjGIDLabel: UILabel!
    
    var whichCase : String = Constants.whichCase
    var objCount : Int = Constants.objCount
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ObjView.ViewBorderFunction(HorW: false, clear: true, amount: 50, borderWidth: 1)
        ObjImageView.ViewBorderFunction(HorW: false, clear: false, amount: 20, borderWidth: 1)
        ObjOwnerImage.ViewBorderFunction(HorW: false, clear: true, amount: 3, borderWidth: 1)
        ObjGIDLabel.isHidden = true
        ObjGIDLabel.text = "234"
        

        
        switch whichCase {
        case "userStar":
            
            ObjImageView.sd_setImage(with: URL(string: Constants.userStarImageURLArrayP[objCount]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjCategoryIcon.image = UIImage(named: Constants.userStarCategotyArray[objCount])
            ObjNameLabel.text = Constants.userStarObjNameArray[objCount]
            ObjOwnerImage.sd_setImage(with: URL(string: Constants.userStarOwnerImageURLArray[objCount]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjOwnerName.text = Constants.userStarOwnerNameArray[objCount]
            ObjGIDLabel.text = String(Constants.userStarGIDArray[objCount])
            print(ObjGIDLabel.text ?? "didnt get ojbect's gid")
            Constants.gidToBeQueued = Constants.userStarGIDArray[objCount]
            
            break
        case "wait4Exch":
            
            ObjImageView.sd_setImage(with: URL(string: Constants.userWait4ExchImageURLArrayP[objCount]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjCategoryIcon.image = UIImage(named: Constants.userWait4ExchCategoryArray[objCount])
            ObjNameLabel.text = Constants.userWait4ExchObjNameArray[objCount]
            ObjOwnerImage.sd_setImage(with: URL(string: Constants.facebookProfilePicURL), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjOwnerName.text = Constants.facebookName
            ObjDescriptionTextView.text = Constants.userWait4ExchDescription[objCount]
            ObjGIDLabel.text = String(Constants.userWait4ExchGIDArray[objCount])
            print(ObjGIDLabel.text ?? "didnt get ojbect's gid")
            Constants.gidToBeQueued = Constants.userWait4ExchGIDArray[objCount]
            
            break
        case "Queuer's_Object":
            
            ObjImageView.sd_setImage(with: URL(string: Constants.userExchRequestQueuerImageURLArrayP[Constants.whichObjCount][Constants.whichQueuerCount]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjCategoryIcon.image = UIImage(named: Constants.userExchRequestQueuerCategoryArray[Constants.whichObjCount][Constants.whichQueuerCount])
            ObjNameLabel.text = Constants.userExchRequestQueuerObjNameArray[Constants.whichObjCount][Constants.whichQueuerCount]
            ObjOwnerImage.sd_setImage(with: URL(string: Constants.userExchRequestQueuerProfileImageArray[Constants.whichObjCount][Constants.whichQueuerCount]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjOwnerName.text = Constants.userExchRequestQueuerNameArray[Constants.whichObjCount][Constants.whichQueuerCount]
            ObjDescriptionTextView.text = Constants.userExchRequestQueuerDescriptionArray[Constants.whichObjCount][Constants.whichQueuerCount]
            ObjGIDLabel.text = String(Constants.userExchRequestQueuerGIDArray[Constants.whichObjCount][Constants.whichQueuerCount])
            print(ObjGIDLabel.text ?? "didnt get ojbect's gid")
            Constants.gidToBeQueued = Constants.userExchRequestQueuerGIDArray[Constants.whichObjCount][Constants.whichQueuerCount]
            
            break
        case "ExchangingOwner":
            
            ObjImageView.sd_setImage(with: URL(string: Constants.userExchangingOwnerImageURLArrayP[objCount]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjCategoryIcon.image = UIImage(named: Constants.userExchangingOwnerCategoryArray[objCount])
            ObjNameLabel.text = Constants.userExchangingOwnerObjNameArray[objCount]
            ObjOwnerImage.sd_setImage(with: URL(string: Constants.facebookProfilePicURL), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjOwnerName.text = Constants.facebookName
            ObjDescriptionTextView.text = Constants.userExchangingOwnerObjDescription[objCount]
            ObjGIDLabel.text = String(Constants.userExchangingOwnerGIDArray[objCount])
            print(ObjGIDLabel.text ?? "didnt get ojbect's gid")
            Constants.gidToBeQueued = Constants.userExchangingOwnerGIDArray[objCount]
            
            break
        case "ExchangingOther":
            
            ObjImageView.sd_setImage(with: URL(string: Constants.userExchangingOtherImageURLArrayP[objCount]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjCategoryIcon.image = UIImage(named: Constants.userExchangingOtherCategoryArray[objCount])
            ObjNameLabel.text = Constants.userExchangingOtherObjNameArray[objCount]
            ObjOwnerImage.sd_setImage(with: URL(string: Constants.userExchangingOtherProfileImageArray[objCount]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjOwnerName.text = Constants.userExchangingOtherNameArray[objCount]
            ObjDescriptionTextView.text = Constants.userExchangingOtherObjDescription[objCount]
            ObjGIDLabel.text = String(Constants.userExchangingOtherGIDArray[objCount])
            print(ObjGIDLabel.text ?? "didnt get ojbect's gid")
            Constants.gidToBeQueued = Constants.userExchangingOtherGIDArray[objCount]
            
            break
        case "HistoryOwner":
            
            ObjImageView.sd_setImage(with: URL(string: Constants.userExchHistoryOwnerImageURLArrayP[objCount]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjCategoryIcon.image = UIImage(named: Constants.userExchHistoryOwnerCategoryArray[objCount])
            ObjNameLabel.text = Constants.userExchHistoryOwnerObjNameArray[objCount]
            ObjOwnerImage.sd_setImage(with: URL(string: Constants.facebookProfilePicURL), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjOwnerName.text = Constants.facebookName
            ObjDescriptionTextView.text = Constants.userExchHistoryOwnerObjDescription[objCount]
            ObjGIDLabel.text = String(Constants.userExchHistoryOwnerGIDArray[objCount])
            print(ObjGIDLabel.text ?? "didnt get ojbect's gid")
            Constants.gidToBeQueued = Constants.userExchHistoryOwnerGIDArray[objCount]
            
            break
        case "HistoryOther":
            
            ObjImageView.sd_setImage(with: URL(string: Constants.userExchHistoryOtherImageURLArrayP[objCount]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjCategoryIcon.image = UIImage(named: Constants.userExchHistoryOtherCategoryArray[objCount])
            ObjNameLabel.text = Constants.userExchHistoryOtherObjNameArray[objCount]
            ObjOwnerImage.sd_setImage(with: URL(string: Constants.userExchHistoryOtherProfileImageArray[objCount]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
            ObjOwnerName.text = Constants.userExchHistoryOtherNameArray[objCount]
            ObjDescriptionTextView.text = Constants.userExchHistoryOtherObjDescription[objCount]
            ObjGIDLabel.text = String(Constants.userExchHistoryOtherGIDArray[objCount])
            print(ObjGIDLabel.text ?? "didnt get ojbect's gid")
            Constants.gidToBeQueued = Constants.userExchHistoryOtherGIDArray[objCount]
            
            break
        default:
            print("It's not working!!!!!")
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        httpGet(URL: "\(Constants.API_SERVER_URL)/api/star/to?goods_gid=\(ObjGIDLabel.text!)", getType: 4)
        if(Constants.starredOrNot == true){
            ObjFollowButton.setImage(UIImage(named: "關注_02"), for: .normal)
            Constants.starredOrNot = false
        }
        else{
            ObjFollowButton.setImage(UIImage(named: "關注_01"), for: .normal)
        }
    }

    @IBAction func dissmissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func followButtonAction(_ sender: Any) {
        if(ObjFollowButton.imageView!.image == UIImage(named: "關注_01")){
            httpPost(URL: "\(Constants.API_SERVER_URL)/api/star/post?token=\(Constants.exwdToken)", parameters: ["goods_gid": Int(ObjGIDLabel.text!) ?? 234, "starring_user_uid": Constants.uid], returnJsonFormat: true)
            ObjFollowButton.setImage(UIImage(named: "關注_02"), for: .normal)
        }else{
            httpDelete(URL: "\(Constants.API_SERVER_URL)/api/star/delete?goods_gid=\(ObjGIDLabel.text!)&starring_user_uid=\(Constants.uid)&token=\(Constants.exwdToken)")
            ObjFollowButton.setImage(UIImage(named: "關注_01"), for: .normal)
        }
    }
    
    @IBAction func queueButtonAction(_ sender: Any) {
        
    }
    
    

    

}
