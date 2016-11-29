//
//  LoginViewController.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/11/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    var token :String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let loginbutton = FBSDKLoginButton()
        view.addSubview(loginbutton)
        loginbutton.frame = CGRect(x: 16, y: 50, width: view.frame.width-32, height: 50)
        loginbutton.delegate = self
        
        
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        //var facebookID : String = ""
        //var facebookProfilePic : String = ""
        
        if error != nil {
            print(error)
            return
        }
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email, picture.type(large)"]).start { (connection, result, err) in
            
            if err != nil {
                print("Failed to start graph request: ",err!)
                return
            }
            
            // result -> facebookID
            let resultInFunc = result as! Dictionary<String, AnyObject>
            for (key,value) in resultInFunc{
                if(key == "id"){
                    Constants.facebookID = value as! String
                }
                if(key == "picture"){
                    let resultInFunc2 = value as! Dictionary<String,AnyObject>
                    for(key2,value2) in resultInFunc2{
                        if(key2 == "data"){
                            let resultInFunc3 = value2 as! Dictionary<String,AnyObject>
                            for (key3,value3) in resultInFunc3{
                                if(key3 == "url"){
                                    Constants.facebookProfilePicURL = value3 as! String
                                    print(Constants.facebookProfilePicURL)
                                }
                            }
                        }
                    }
                }
            }
           
         
            
            httpPost(URL: "\(Constants.API_SERVER_URL)/api/authenticate/login", parameters: ["fb": true , "identity": Constants.facebookID])
            //self.posting(URL: "http://exwd.csie.org:43002/api/goods/post?token=a8127148e28cdac117c80b77c1d7527795104f36")
        }
        
        let storyboard: UIStoryboard = self.storyboard!
        let TabBarController = storyboard.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
        self.present(TabBarController, animated: true, completion: nil)
        
    }
    
    @IBAction func performsegue(_ sender: Any) {
        self.performSegue(withIdentifier: "LoginSegue", sender: nil)
        print("--------------")
    }
    
    
    
}
