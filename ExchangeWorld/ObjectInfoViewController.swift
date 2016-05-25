//
//  ObjectInfoViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/5/25.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit

class ObjectInfoViewController: UIViewController {
    
    @IBOutlet var objImageView: UIImageView!

    var objimage = String()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //let screenSize: CGRect = UIScreen.mainScreen().bounds
        //objImageView.frame = CGRectMake(0,0, self.view.frame.width,self.view.frame.width*64/100 )
        objImageView.image = UIImage(named: objimage)
        
        //print(screenSize.height)
        //print(screenSize.width)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
