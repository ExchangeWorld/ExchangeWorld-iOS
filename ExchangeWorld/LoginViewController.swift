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
        if error != nil {
            print(error)
            return
        }
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            
            if err != nil {
                print("Failed to start graph request: ",err)
                return
            }
            
            print(result)
            httpPost(URL: "\(Constants.API_SERVER_URL)/api/authenticate/login", parameters: ["fb": true , "identity": "991503670923024"],token: self.token)
            //self.posting(URL: "http://exwd.csie.org:43002/api/goods/post?token=a8127148e28cdac117c80b77c1d7527795104f36")
        }
        let destViewController = self.storyboard?.instantiateViewController(withIdentifier: "tabBarViewController")
        self.navigationController?.pushViewController(destViewController!, animated: true)
    }
    
}
