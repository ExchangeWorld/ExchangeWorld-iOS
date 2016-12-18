//
//  ObjectInfoViewController.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/11/2.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class ObjectInfoViewController: UIViewController {

    @IBOutlet weak var objImageView: UIImageView!
    @IBOutlet weak var objNameLabel: UILabel!
    @IBOutlet weak var ObjDescriptionLabel: UILabel!
    @IBOutlet weak var objFollowButton: UIButton!
    @IBOutlet weak var objQueueButton: UIButton!
    
    var object: Object!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rawPath = object.photo_path
        let leftIndexToStrip = rawPath.index(rawPath.startIndex, offsetBy: 2)
        let rightIndexToStrip = rawPath.index(rawPath.endIndex, offsetBy: -2)
        let path = rawPath.substring(with: leftIndexToStrip..<rightIndexToStrip)
        
        if let url = URL(string: path), let data = try? Data(contentsOf: url) {
            self.objImageView.image = UIImage(data: data)
        }
        self.objNameLabel.text = object.name
        self.ObjDescriptionLabel.text = "商品描述：\(object.description)"
        print(object.gid)
    }
    
    @IBAction func followButtonAction(_ sender: Any) {
        
        if(objFollowButton.imageView!.image == UIImage(named: "關注_01")){
            objFollowButton.setImage(UIImage(named: "關注_02"), for: .normal)
        }else{
            objFollowButton.setImage(UIImage(named: "關注_01"), for: .normal)
        }
        
    }

    @IBAction func queueButtonAction(_ sender: Any) {
        
        if(objQueueButton.imageView?.image == UIImage(named: "排_01")){
            objQueueButton.setImage(UIImage(named: "排_02"), for: .normal)
        }else{
            objQueueButton.setImage(UIImage(named: "排_01"), for: .normal)
        }
    }
  

}
