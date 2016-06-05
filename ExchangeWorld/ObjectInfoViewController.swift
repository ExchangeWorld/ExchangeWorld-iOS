//
//  ObjectInfoViewController.swift
//  ExchangeWorld
//
//  Created by 盧與明 on 2016/6/2.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit

class ObjectInfoViewController: UIViewController {

    @IBOutlet weak var objImageView: UIImageView!
    @IBOutlet weak var objNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sharingImageView: UIImageView!
    @IBOutlet weak var liningImageView: UIImageView!
    @IBOutlet weak var followingImageView: UIImageView!
    
    var object: Object!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(ObjectInfoViewController.imageTapped(_:)))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(ObjectInfoViewController.imageTapped(_:)))
        // what's the difference between tapGes1 and tapGes2
 
        liningImageView.userInteractionEnabled = true
        followingImageView.userInteractionEnabled = true
        liningImageView.addGestureRecognizer(tapGestureRecognizer1)
        followingImageView.addGestureRecognizer(tapGestureRecognizer2)
        
        self.objImageView.image = UIImage(named: self.object.category)
//        self.objImageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: self.object.photo_path)!)!)
        self.objNameLabel.text = self.object.name
        self.descriptionLabel.text = self.object.name
        self.sharingImageView.image = UIImage(named: "分享")
        self.liningImageView.image = UIImage(named: "排_01")
        self.followingImageView.image = UIImage(named: "關注_01")
    }
    
    func imageTapped(sender: UITapGestureRecognizer){
        let imageView = sender.view as! UIImageView
        if imageView === liningImageView {
            if imageView.image == UIImage(named:"排_01") {
                imageView.image = UIImage(named:"排_02")
            } else {
                imageView.image = UIImage(named: "排_01")
            }
        } else if imageView === followingImageView {
            if imageView.image == UIImage(named:"關注_01") {
                imageView.image = UIImage(named: "關注_02")
            } else {
                imageView.image = UIImage(named: "關注_01")
            }
        }
        
    }  //something wrong here, 重新載入顏色就消失

}
