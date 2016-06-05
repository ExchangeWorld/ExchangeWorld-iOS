//
//  HomeObjectCategoryCollectionViewController.swift
//  ExchangeWorld
//
//  Created by 盧與明 on 2016/5/30.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit

class HomeObjectCategoryCollectionViewController: UICollectionViewController {


    @IBOutlet var homeObjectCategoryCollectionView: UICollectionView!
    
//    let objectImageArray = ["Book", "Textbooks", "3C", "3C_accessories", "Clothes", "Cosmetic", "Accessories", "Food", "Houseware", "Sports", "Games", "Others"]
    let objectImageArray = ["Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks"]  // Missing photos of "3C_accessories", "Accessories", "Food", "Houseware", "Sports", "Games"
        
    private let numberOfItemsPerRow: CGFloat = 2.0
    private let heightAdjustment: CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let leftAndRightPaddings = self.view.frame.width*83/377
        let width = (CGRectGetWidth(collectionView!.frame)-leftAndRightPaddings) / numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width)

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return objectImageArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HomeObjectCategoryCollectionViewCell", forIndexPath: indexPath) as! HomeObjectCategoryCollectionViewCell
        
        let cornerRadiusOfCell = cell.bounds.size.height/2
        if cell.categoryImageView.layer.cornerRadius != cornerRadiusOfCell {
            cell.categoryImageView.layer.cornerRadius = cornerRadiusOfCell;
        }
        cell.categoryImageView?.image = UIImage(named: self.objectImageArray[indexPath.row])
    
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifirer = segue.identifier else {
            return // what can this do?
        }
        
        if segueIdentifirer == "ShowHomeObjectCategoryDetail" {
            guard let detailViewController = segue.destinationViewController as? HomeObjectCollectionViewController else {
                return
            }
            
            guard let cell = sender as? UICollectionViewCell else {return}
            let indexPath = self.collectionView?.indexPathForCell(cell)
            
            detailViewController.categoryName = self.objectImageArray[indexPath!.row]
            
        }
        
    }
    
    


}
