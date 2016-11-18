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
    }



}
