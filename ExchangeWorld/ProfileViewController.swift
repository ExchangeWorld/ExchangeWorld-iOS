//
//  ProfileViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/11/20.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBAction func profileSegmentedControlAction(_ sender: UISegmentedControl) {
        
        switch (profileSegmentedControl.selectedSegmentIndex) {
        case 0:
            self.wishListView.isHidden = false
            self.waitingForExchangeView.isHidden = true
            self.exchangeSecceedView.isHidden = true
            self.exchangeRequestView.isHidden = true
            self.exchangeHistoryView.isHidden = true
            
            break
        case 1:
            self.wishListView.isHidden = true
            self.waitingForExchangeView.isHidden = false
            self.exchangeSecceedView.isHidden = true
            self.exchangeRequestView.isHidden = true
            self.exchangeHistoryView.isHidden = true
            
            break
        case 2:
            self.wishListView.isHidden = true
            self.waitingForExchangeView.isHidden = true
            self.exchangeSecceedView.isHidden = false
            self.exchangeRequestView.isHidden = true
            self.exchangeHistoryView.isHidden = true
            
            break
        case 3:
            self.wishListView.isHidden = true
            self.waitingForExchangeView.isHidden = true
            self.exchangeSecceedView.isHidden = true
            self.exchangeRequestView.isHidden = false
            self.exchangeHistoryView.isHidden = true
            
            break
        case 4:
            self.wishListView.isHidden = true
            self.waitingForExchangeView.isHidden = true
            self.exchangeSecceedView.isHidden = true
            self.exchangeRequestView.isHidden = true
            self.exchangeHistoryView.isHidden = false
            
            break
        
        default:
            break
        }
        
        profileSegmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black], for: .selected)

        
    }
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var userProfileName: UILabel!
    @IBOutlet weak var userLocationName: UILabel!
    @IBOutlet weak var profileSegmentedControl: ProfileSegmentedControl!
    @IBOutlet weak var wishListView: UIView!
    @IBOutlet weak var waitingForExchangeView: UIView!
    @IBOutlet weak var exchangeSecceedView: UIView!
    @IBOutlet weak var exchangeRequestView: UIView!
    @IBOutlet weak var exchangeHistoryView: UIView!
    
    var userStarImageURLArrayFromPro : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let screenSize: CGRect = UIScreen.main.bounds
        
        print("----------------")
        print(Constants.facebookID)
        print(Constants.facebookProfilePicURL)
        print("----------------")
        
        
        print("Begin of code")
        if let checkedUrl = URL(string: "\(Constants.facebookProfilePicURL)") {
            userProfilePic.contentMode = .scaleAspectFit
            userProfilePic.frame = CGRect(x: screenSize.width*0.23, y: screenSize.height*0.13, width: screenSize.width*0.26, height: screenSize.width*0.26)
            userProfilePic.layer.borderWidth = 1
            userProfilePic.layer.masksToBounds = false
            userProfilePic.layer.borderColor = UIColor.black.cgColor
            //self.view.layoutIfNeeded()
            userProfilePic.layer.cornerRadius = userProfilePic.frame.height/2
            userProfilePic.clipsToBounds = true
            downloadImage(url: checkedUrl)
        }
        print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
        
        userProfileName.text = Constants.facebookName
        userProfileName.frame = CGRect(x: screenSize.width*0.54, y: screenSize.height*0.15, width: screenSize.width*0.4, height: screenSize.width*0.1)
        userProfileName.font = UIFont.systemFont(ofSize: 25, weight: 0.14)
        userLocationName.text = "台北市文山區"
        userLocationName.frame = CGRect(x: screenSize.width*0.54, y: screenSize.height*0.2, width: screenSize.width*0.4, height: screenSize.width*0.1)
        userLocationName.font = UIFont.systemFont(ofSize: 15)
        profileSegmentedControl.frame = CGRect(x: 0, y: screenSize.height*0.34, width: screenSize.width, height: screenSize.height*0.05)
        //profileSegmentedControl.selectedindex[0].isSelected = true
        
        self.wishListView.isHidden = false
        self.waitingForExchangeView.isHidden = true
        self.exchangeSecceedView.isHidden = true
        self.exchangeRequestView.isHidden = true
        self.exchangeHistoryView.isHidden = true
        self.profileSegmentedControl.initUI()
        self.wishListView.frame = CGRect(x: 0, y: screenSize.height*0.39, width: screenSize.width, height: screenSize.height*0.55)
        self.waitingForExchangeView.frame = self.wishListView.frame
        self.exchangeSecceedView.frame = self.wishListView.frame
        self.exchangeRequestView.frame = self.wishListView.frame
        self.exchangeHistoryView.frame = self.wishListView.frame
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"profileBackground")!)
        
//        let heightConstraint = NSLayoutConstraint(item: exchangeHistoryView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: screenSize.height*0.53)
//        exchangeHistoryView.addConstraint(heightConstraint)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.userProfilePic.image = UIImage(data: data)
            }
        }
    }
    
    
    
}
