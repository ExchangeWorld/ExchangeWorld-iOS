//
//  ObjectCollectionViewController.swift
//  UIPageViewController Post
//
//  Created by 王志尹 on 2016/5/8.
//  Copyright © 2016年 Seven Even. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"



class ObjectCollectionViewController: UICollectionViewController {
    
    @IBOutlet var ObjectCollecitonView: UICollectionView!
    
    var SecondArray = [String]()
    var objcollectionviewcell = ObjectCollectionViewCell()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        objcollectionviewcell.objImageView.image = self.objimage
//        self.objNameLabel.text = self.objname.text
//        self.objCategoryNameLabel.text = self.objcategoryname.text
//        self.objOwnerLabel.text = self.objowner.text
//        self.objCategoryIcon.image = self.objcategoryicon
//        self.objOwnerIcon.image = objownericon

        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SecondArray.count
    }
    


    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("objectCell", forIndexPath: indexPath) as! ObjectCollectionViewCell
        
        cell.objImageView.image = UIImage(named: SecondArray[indexPath.row])
    
    
        return cell
    }

    
}
