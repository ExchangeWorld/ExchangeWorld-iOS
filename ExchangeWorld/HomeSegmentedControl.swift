//
//  HomeSegmentedControl.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/11/2.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class HomeSegmentedControl: UISegmentedControl {

    func initUI() {
        setBackground()
        setFonts()
    }
    
    func setBackground() {
        self.tintColor = UIColor(red: 128.0/255.0, green: 192.0/255.0, blue: 189.0/255.0, alpha: 1.0)
    }
    
    func setFonts() {
        let font = UIFont.systemFont(ofSize: 16.0)
        
        let normalTextAttributes = [
            NSForegroundColorAttributeName: UIColor.black,
            NSFontAttributeName: font
        ]
        
        self.setTitleTextAttributes(normalTextAttributes, for: .normal)
        self.setTitleTextAttributes(normalTextAttributes, for: .highlighted)
        self.setTitleTextAttributes(normalTextAttributes, for: .selected)
    }
}
