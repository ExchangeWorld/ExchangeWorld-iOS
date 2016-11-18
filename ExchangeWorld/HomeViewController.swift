//
//  HomeViewController.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/10/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var homeNavigationBar: UINavigationBar!
    @IBOutlet weak var homeSegmentedControl: HomeSegmentedControl!
    @IBOutlet weak var homeMapContainerView: UIView!
    @IBOutlet weak var homeAreaCategoryContainerView: UIView!
    @IBOutlet weak var homeObjectCategoryContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeSegmentedControl.initUI()
//        self.homeMapContainerView.isHidden = true
        self.homeAreaCategoryContainerView.isHidden = true
        self.homeObjectCategoryContainerView.isHidden = true
    }

    @IBAction func homeSegmentedControlChangeTab(_ sender: UISegmentedControl) {
        
        switch (homeSegmentedControl.selectedSegmentIndex) {
        case 0:
            self.homeMapContainerView.isHidden = false
            self.homeAreaCategoryContainerView.isHidden = true
            self.homeObjectCategoryContainerView.isHidden = true
            break
        case 1:
            self.homeMapContainerView.isHidden = true
            self.homeAreaCategoryContainerView.isHidden = false
            self.homeObjectCategoryContainerView.isHidden = true
            break
        case 2:
            self.homeMapContainerView.isHidden = true
            self.homeAreaCategoryContainerView.isHidden = true
            self.homeObjectCategoryContainerView.isHidden = false
            break
        default:
            break
        }
        
    }
    
    
    
    
}
