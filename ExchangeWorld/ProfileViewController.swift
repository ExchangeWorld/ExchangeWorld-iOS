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
        print(Constants.facebookProfilePicURL)
        print("----------------")
        
        
        print("Begin of code")
        if let checkedUrl = URL(string: "\(Constants.facebookProfilePicURL)") {
            userProfilePic.contentMode = .scaleAspectFit
            userProfilePic.layer.borderWidth = 1
            userProfilePic.layer.masksToBounds = false
            userProfilePic.layer.borderColor = UIColor.black.cgColor
            userProfilePic.layer.cornerRadius = userProfilePic.frame.height/2
            userProfilePic.clipsToBounds = true
            downloadImage(url: checkedUrl)
        }
        print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
        
        
        //userProfilePic = Constants.facebookProfilePic as UIImage
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
