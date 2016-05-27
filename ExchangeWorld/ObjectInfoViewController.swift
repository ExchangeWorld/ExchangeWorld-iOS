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
    @IBOutlet var objNameLabel: UILabel!
    @IBOutlet var sharingImageView: UIImageView!
    @IBOutlet var liningImageView: UIImageView!
    @IBOutlet var follingImageView: UIImageView!

    var objimage = String()
    var objname = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let liningimage = liningImageView
        let follingimage = follingImageView
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("imageTapped:"))
        liningimage.userInteractionEnabled = true
        follingimage.userInteractionEnabled = true
        liningimage.addGestureRecognizer(tapGestureRecognizer)
        follingimage.addGestureRecognizer(tapGestureRecognizer)
        
        
        objImageView.image = UIImage(named: objimage)
        objNameLabel.text = objname
        sharingImageView.image = UIImage(named: "分享")
        liningImageView.image = UIImage(named: "排_01")
        follingImageView.image = UIImage(named: "關注_01")
    }
    
    func imageTapped(img: UIImageView){
        if img.image == UIImage(named:"排_01"){
            img.image = UIImage(named: "排_02")
        }
        
        else if img.image == "排_02"{
            img.image = UIImage(named: "排_01")
        }
        
        else if img.image == UIImage(named:"關注_01"){
            img.image = UIImage(named: "關注_02")
        }
        
        else {
            img.image = UIImage(named: "關注_01")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        objImageView.frame = CGRectMake(0,0, self.view.frame.width,self.view.frame.width*0.64 )
        objNameLabel.frame = CGRectMake(self.view.frame.width*0.106, self.view.frame.width*0.68, self.view.frame.width*300/375,self.view.frame.width*31/375)
        sharingImageView.frame = CGRectMake(self.view.frame.width*0.06, self.view.frame.width*0.8, self.view.frame.width*77/375,self.view.frame.width*31/375)
        liningImageView.frame = CGRectMake(self.view.frame.width*0.403, self.view.frame.width*0.8, self.view.frame.width*77/375,self.view.frame.width*31/375)
        follingImageView.frame = CGRectMake(self.view.frame.width*0.746, self.view.frame.width*0.8,self.view.frame.width*77/375,self.view.frame.width*31/375)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    

}
