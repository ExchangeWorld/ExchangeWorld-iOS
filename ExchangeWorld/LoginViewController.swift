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
        
        
        //performsegue(123)
        //self.performsegue(123)
        self.performSegue(withIdentifier: "LoginSegue", sender: nil)
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        var facebookID : String = ""
        
        if error != nil {
            print(error)
            return
        }
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            
            if err != nil {
                print("Failed to start graph request: ",err!)
                return
            }
            
            // result -> facebookID
            let resultInFunc = result as! Dictionary<String, AnyObject>
            for (key,value) in resultInFunc{
                if(key == "id"){
                    facebookID = value as! String
                }
            }
            
            
            httpPost(URL: "\(Constants.API_SERVER_URL)/api/authenticate/login", parameters: ["fb": true , "identity": facebookID],returnString: self.token)
            //self.posting(URL: "http://exwd.csie.org:43002/api/goods/post?token=a8127148e28cdac117c80b77c1d7527795104f36")
        }
        
        //performsegue(sender: 123)
        
        //performSegue(withIdentifier: "LoginSegue", sender: nil)
//        let destViewController = self.storyboard?.instantiateViewController(withIdentifier: "tabBarViewController")
//        self.navigationController?.pushViewController(destViewController!, animated: true)
    }
    
    @IBAction func performsegue(_ sender: Any) {
        self.performSegue(withIdentifier: "LoginSegue", sender: nil)
        print("--------------")
    }
    
    
    
}
