//
//  HomeSegmentedControl.swift
//  ExchangeWorld
//
//  Created by 盧與明 on 2016/5/16.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit

class HomeSegmentedControl: UISegmentedControl {

    func initUI(){
        setupBackground()
        setupFonts()
    }
    
    func setupBackground(){
        self.tintColor = UIColor(red: 128.0/255.0, green: 192.0/255.0, blue: 189.0/255.0, alpha: 1.0)
    }
    
    func setupFonts(){
        let font = UIFont.systemFontOfSize(16.0)
        
        
        let normalTextAttributes = [
            NSForegroundColorAttributeName: UIColor.blackColor(),
            NSFontAttributeName: font
        ]
        
        self.setTitleTextAttributes(normalTextAttributes, forState: .Normal)
        self.setTitleTextAttributes(normalTextAttributes, forState: .Highlighted)
        self.setTitleTextAttributes(normalTextAttributes, forState: .Selected)
    }

}
