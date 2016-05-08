//
//  ObjectCategoryCollectionViewController.swift
//  UIPageViewController Post
//
//  Created by 王志尹 on 2016/5/8.
//  Copyright © 2016年 Seven Even. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ObjectCategoryCollectionViewController: UICollectionViewController {

    let objectcategories = ObjectCategories()
    
    let ocImageArray = [UIImage(named: "3C"), UIImage(named: "Book"), UIImage(named: "Clothes"), UIImage(named: "Makeup"), UIImage(named: "Textbook"), UIImage(named: "Others")]
    
    // for dynamic column
    private let leftAndRightPaddings: CGFloat = 80.0
    private let numberOfItemsPerRow: CGFloat = 2.0
    private let heightAdjustment: CGFloat = 100.0
    
    
    
    //MARK : - View controller life cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        let width = (CGRectGetWidth(collectionView!.frame)-leftAndRightPaddings) / numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width)
        
        
        
        let titleButton: UIButton = UIButton (frame: CGRectMake(0, 0, 100, 32))
        
        titleButton.setTitle("Exchange World", forState: UIControlState.Normal)
        
        titleButton.titleLabel?.font = UIFont(name: "Medium", size: 25.0)
        
        //titleButton.addTarget(self, action: #selector(ObjectCategoryViewController.titlePressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.navigationItem.titleView = titleButton
        
    }
    
    /*    - If we want to have action on title
    @IBAction func titlePressed(sender: UIButton) { print("hi its working") }
    */
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return ocImageArray.count
    }
    
    private struct Storyboard
    {
        static let CellIdentifier = "ObjectCategoryCell"
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ObjectCategoryCell", forIndexPath: indexPath) as! ObjectCategoryCollectionViewCell
    
        cell.categoryImageView?.image = self.ocImageArray[indexPath.row]
        
        return cell
    }

    
}
























