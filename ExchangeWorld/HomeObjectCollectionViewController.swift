//
//  HomeObjectCollectionViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/5/22.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit


class MyLayout: UICollectionViewLayout {
    
}


class HomeObjectCollectionViewController: UICollectionViewController {

    @IBOutlet var ObjectCollectionView: UICollectionView!
    
    var objcollectionviewcell = HomeObjectCollectionViewCell()
    var ObjectImageArray = [String]()
    var ObjectNameArray = [String]()
    var ObjectCategoryIconArray = [String]()
    var ObjectOwnerIconArray = [String]()
    var ObjectCategoryNameArray = [String]()
    var ObjectOwnerNameArray = [String]()
    var ObjectInfoImageArray = [String]()
    var ObjectInfoNameArray = [String]()
    var ObjectInfoDescriptionArray = [String]()
    
    
    private let leftAndRightPaddings: CGFloat = 20.0
    private let heightAdjustment: CGFloat = 100.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let width = CGRectGetWidth(collectionView!.frame)-leftAndRightPaddings
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, (width*0.5))
        
//        objcollectionviewcell.objImageView.frame = CGRectMake(0, 0, width*3/4, width*3/4)
//        print(width*3/4)
//        objcollectionviewcell.objImageView.frame.size.width = width*3/4
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        //let width = CGRectGetWidth(collectionView!.frame)-leftAndRightPaddings
//        //objcollectionviewcell.objImageView.frame = CGRectMake(0,0, width*232/377,width*174/377 )
//        
//        
//        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ObjectImageArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("objectCell", forIndexPath: indexPath) as! HomeObjectCollectionViewCell
        let width = CGRectGetWidth(collectionView.frame)-leftAndRightPaddings
        
        cell.objImageView.image = UIImage(named: ObjectImageArray[indexPath.row])
        //cell.objImageView.frame = CGRectMake(0,0, width*232/377,width*174/377 )
        cell.objNameLabel.text = ObjectNameArray[indexPath.row]
        cell.objCategoryImageView.image = UIImage(named: ObjectCategoryIconArray[indexPath.row])
        cell.objOwnerImageView.image = UIImage(named: ObjectOwnerIconArray[indexPath.row])
        cell.objCategoryNameLabel.text = ObjectCategoryNameArray[indexPath.row]
        cell.objOwnerNameLabel.text = ObjectOwnerNameArray[indexPath.row]
    
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showObjectInfo"{
            
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            let DestViewController = segue.destinationViewController as! ObjectInfoViewController
            
            DestViewController.objimage = ObjectInfoImageArray[indexPath.row]
            DestViewController.objname = ObjectInfoNameArray[indexPath.row]
            DestViewController.objdescription = ObjectInfoDescriptionArray[indexPath.row]
            
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
