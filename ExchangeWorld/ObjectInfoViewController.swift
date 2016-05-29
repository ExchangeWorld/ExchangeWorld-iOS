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
    @IBOutlet var descriptionLabel: UILabel!
    

    var objimage = String()
    var objname = String()
    var objdescription = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let liningimage = liningImageView
        let follingimage = follingImageView
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(ObjectInfoViewController.imageTapped(_:)))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(ObjectInfoViewController.imageTapped(_:)))
        liningimage.userInteractionEnabled = true
        follingimage.userInteractionEnabled = true
        liningimage.addGestureRecognizer(tapGestureRecognizer1)
        follingimage.addGestureRecognizer(tapGestureRecognizer2)
        
        
        objImageView.image = UIImage(named: objimage)
        objNameLabel.text = objname
        descriptionLabel.text = objdescription
        sharingImageView.image = UIImage(named: "分享")
        liningImageView.image = UIImage(named: "排_01")
        follingImageView.image = UIImage(named: "關注_01")
    }
    
    func imageTapped(sender: UITapGestureRecognizer){
//        guard let imageView = sender.view as? UIImageView else {
//            return
//        }
        let imageView = sender.view as! UIImageView
        if imageView === liningImageView {
            if imageView.image == UIImage(named:"排_01"){
                imageView.image = UIImage(named:"排_02")
            }
            
            else {
                imageView.image = UIImage(named: "排_01")
            }
            
        } else if imageView === follingImageView {
            if imageView.image == UIImage(named:"關注_01"){
                imageView.image = UIImage(named: "關注_02")
            }
                
            else {
                imageView.image = UIImage(named: "關注_01")
            }
            
        }
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        let imageView = UIImageView()
//        // imageView.Height == imageView.Width * 0.64 + 0.0
//        let constraint = NSLayoutConstraint(item: imageView,
//                                            attribute: .Height,
//                                            relatedBy: .Equal,
//                                            toItem: imageView,
//                                            attribute: .Width,
//                                            multiplier: 0.64,
//                                            constant: 0.0)
//        imageView.addConstraint(constraint)
        
        objImageView.frame = CGRectMake(0,0, self.view.frame.width,self.view.frame.width*0.64 )
        objNameLabel.frame = CGRectMake(self.view.frame.width*0.106, self.view.frame.width*0.68, self.view.frame.width*300/375,self.view.frame.width*31/375)
        sharingImageView.frame = CGRectMake(self.view.frame.width*0.06, self.view.frame.width*0.8, self.view.frame.width*77/375,self.view.frame.width*31/375)
        liningImageView.frame = CGRectMake(self.view.frame.width*0.403, self.view.frame.width*0.8, self.view.frame.width*77/375,self.view.frame.width*31/375)
        follingImageView.frame = CGRectMake(self.view.frame.width*0.746, self.view.frame.width*0.8,self.view.frame.width*77/375,self.view.frame.width*31/375)
        descriptionLabel.frame = CGRectMake(self.view.frame.width*0.03, self.view.frame.width*0.93,self.view.frame.width*352/375,self.view.frame.width*0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    

}
