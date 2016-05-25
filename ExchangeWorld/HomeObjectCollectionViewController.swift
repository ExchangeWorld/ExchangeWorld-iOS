//
//  HomeObjectCollectionViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/5/22.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit


class HomeObjectCollectionViewController: UICollectionViewController {

    @IBOutlet var ObjectCollectionView: UICollectionView!
    
    var objcollectionviewcell = HomeObjectCollectionViewCell()
    var ObjectArray = [String]()
    var SecondAnswerArray = [String]()
    
    private let leftAndRightPaddings: CGFloat = 20.0
    private let numberOfItemsPerRow: CGFloat = 2.0
    private let heightAdjustment: CGFloat = 100.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let width = CGRectGetWidth(collectionView!.frame)-leftAndRightPaddings
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, (width*3/4))
        
//        objcollectionviewcell.objImageView.frame = CGRectMake(0, 0, width*3/4, width*3/4)
//        print(width*3/4)
//        objcollectionviewcell.objImageView.frame.size.width = width*3/4
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ObjectArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("objectCell", forIndexPath: indexPath) as! HomeObjectCollectionViewCell
        
        cell.objImageView.image = UIImage(named: ObjectArray[indexPath.row])
    
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showObjectInfo"{
            
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            let DestViewController = segue.destinationViewController as! ObjectInfoViewController
            
            DestViewController.objimage = SecondAnswerArray[indexPath.row]
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
