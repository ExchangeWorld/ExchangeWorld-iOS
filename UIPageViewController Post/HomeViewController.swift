//
//  HomeViewController.swift
//  UIPageViewController Post
//
//  Created by Jeffrey Burt on 2/3/16.
//  Copyright © 2016 Seven Even. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    var homePageViewController: HomePageViewController? {
        didSet {
            homePageViewController?.homeDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.addTarget(self, action: "didChangePageControlValue", forControlEvents: .ValueChanged)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let homePageViewController = segue.destinationViewController as? HomePageViewController {
            self.homePageViewController = homePageViewController
        }
    }

    @IBAction func didTapNextButton(sender: UIButton) {
        homePageViewController?.scrollToNextViewController()
    }
    
    /**
     Fired when the user taps on the pageControl to change its current page.
     */
    func didChangePageControlValue() {
        homePageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
}

extension HomeViewController: HomePageViewControllerDelegate {
    
    func homePageViewController(homePageViewController: HomePageViewController,
        didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func homePageViewController(homePageViewController: HomePageViewController,
        didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}
