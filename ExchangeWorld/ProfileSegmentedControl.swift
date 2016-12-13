//
//  ProfileSegmentedControl.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/11/30.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class ProfileSegmentedControl: UISegmentedControl {

    func initUI() {
        setBackground()
        setFonts()
    }
    
    func setBackground() {
        self.tintColor = UIColor.white
    }
    
    func setFonts() {
        let font = UIFont.systemFont(ofSize: 16.0)
        
        let normalTextAttributes = [
            NSForegroundColorAttributeName: UIColor.lightGray,
            NSFontAttributeName: font
        ]
        
        
        
        self.setTitleTextAttributes(normalTextAttributes, for: .normal)
        self.setTitleTextAttributes(normalTextAttributes, for: .highlighted)
        self.setTitleTextAttributes(normalTextAttributes, for: .selected)
        
    }

}
