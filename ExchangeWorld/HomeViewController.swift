//
//  HomeViewController.swift
//  ExchangeWorld
//
//  Created by 盧與明 on 2016/5/16.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeNevigationBar: UINavigationBar!
    @IBOutlet weak var homeSegmentedControl: HomeSegmentedControl!
    
    @IBOutlet weak var homeMapTabContainerView: UIView!
    @IBOutlet weak var homeObjectCategoryTabContainerView: UIView!
    @IBOutlet weak var homeAreaCategoryTabContainerView: UIView!
        
    @IBAction func homeSegmentedControlChangeTab(sender: UISegmentedControl) {
 
        switch (homeSegmentedControl.selectedSegmentIndex) {
        case 0:
            self.homeMapTabContainerView.hidden = false
            self.homeObjectCategoryTabContainerView.hidden = true
            self.homeAreaCategoryTabContainerView.hidden = true
            break
        case 1:
            self.homeMapTabContainerView.hidden = true
            self.homeObjectCategoryTabContainerView.hidden = false
            self.homeAreaCategoryTabContainerView.hidden = true
            break
        case 2:
            self.homeMapTabContainerView.hidden = true
            self.homeObjectCategoryTabContainerView.hidden = true
            self.homeAreaCategoryTabContainerView.hidden = false
            break
        default:
            break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeSegmentedControl.initUI()
        self.homeObjectCategoryTabContainerView.hidden = true
        self.homeAreaCategoryTabContainerView.hidden = true
    }

}
