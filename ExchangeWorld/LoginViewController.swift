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
            
            print(result)
            
            // result -> facebookID
            let resultInFunc = result as! Dictionary<String, AnyObject>
            for (key,value) in resultInFunc{
                if(key == "id"){
                    Constants.facebookID = value as! String
                }
                if(key == "name"){
                    Constants.facebookName = value as! String
                    print(Constants.facebookName)
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
           
         
            
            httpPost(URL: "\(Constants.API_SERVER_URL)/api/authenticate/login", parameters: ["fb": true , "identity": Constants.facebookID], returnJsonFormat : true)
        
            //get uid, userStarImage
            
            let url = NSURL(string: "\(Constants.API_SERVER_URL)/api/user?identity=\(Constants.facebookID)")
            
            let task = URLSession.shared.dataTask(with: url! as URL) {(data, response, error) in
                if error != nil
                {
                    print("error=\(error)")
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    
                    for dictionary1 in json as! [String: Any] {
                        if(dictionary1.key == "uid"){
                            Constants.uid = dictionary1.value as! Int
                            print(Constants.uid)
                        }
                        if(dictionary1.key == "star_starring_user"){
                            let dictionary1Value = (dictionary1.value as AnyObject)
                            for count in 1...dictionary1Value.count{
                                for dictionary2 in dictionary1Value[count-1] as! [String: Any]{
                                    if(dictionary2.key == "goods"){
                                        let dictionary2Value = (dictionary2.value as AnyObject)
                                        
                                        for dictionary3 in dictionary2Value as! [String: Any]{
                                            if(dictionary3.key == "photo_path"){
                                                Constants.userStarImageURLArrayNP.append(dictionary3.value as! String)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Constants.userStarImageURLArrayP = urlArrayTranformation(url: Constants.userStarImageURLArrayNP)
                    print(Constants.userStarImageURLArrayP)
                }catch{
                    print("JSONERROR")
                }
            }
            task.resume()
        
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
