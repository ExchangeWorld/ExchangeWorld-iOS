//
//  HomeObjectCategoryTabViewController.swift
//  ExchangeWorld
//
//  Created by 盧與明 on 2016/5/16.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit

class HomeObjectCategoryCollectionViewController: UICollectionViewController {

    @IBOutlet var ObjectCategoryCollectionView: UICollectionView!
    
    var ocImageArray = [String]()
    var ObjectArray = [ObjectTable]()
    var ObjInfoImageArray = [ObjectInfoTable]()
    
    
    // for dynamic column
    private let leftAndRightPaddings: CGFloat = 80.0
    private let numberOfItemsPerRow: CGFloat = 2.0
    private let heightAdjustment: CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (CGRectGetWidth(collectionView!.frame)-leftAndRightPaddings) / numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width)
        
        ocImageArray = ["3C", "Book", "Clothes", "Makeup", "Textbook", "Others"]
        
        ObjectArray = [
        ObjectTable(ObjectImage: ["羅生門", "賴和全集", "蚱蜢"]),
        ObjectTable(ObjectImage: ["羅生門", "蚱蜢", "賴和全集"]),
        ObjectTable(ObjectImage: ["蚱蜢", "羅生門", "賴和全集"]),
        ObjectTable(ObjectImage: ["蚱蜢", "賴和全集", "羅生門"]),
        ObjectTable(ObjectImage: ["賴和全集", "蚱蜢", "羅生門"]),
        ObjectTable(ObjectImage: ["賴和全集", "羅生門", "蚱蜢"])]
        
        ObjInfoImageArray = [
        ObjectInfoTable(objImageArray:["羅生門", "賴和全集", "蚱蜢"]),
        ObjectInfoTable(objImageArray:["羅生門", "蚱蜢", "賴和全集"]),
        ObjectInfoTable(objImageArray:["蚱蜢", "羅生門", "賴和全集"]),
        ObjectInfoTable(objImageArray:["蚱蜢", "賴和全集", "羅生門"]),
        ObjectInfoTable(objImageArray:["賴和全集", "蚱蜢", "羅生門"]),
        ObjectInfoTable(objImageArray:["賴和全集", "羅生門", "蚱蜢"]),
        ]
        
//        for i in 1 ... ObjectArray.count{
//            ObjInfoImageArray[i].objImageArray = ObjectArray[i].ObjectImage
//        }
        
        //print (ObjInfoImageArray)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ocImageArray.count
    }

    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ObjectCategoryCell", forIndexPath: indexPath) as! HomeObjectCategoryCollectionViewCell
        
        cell.categoryImageView?.image = UIImage(named: self.ocImageArray[indexPath.row])
        
        return cell
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showObjects", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showObjects"{
            
            
            
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let objinfo = segue.destinationViewController as! HomeObjectCollectionViewController
            
            
            var ObjectTableArrayTwo : ObjectTable
            ObjectTableArrayTwo = ObjectArray[indexPath.row]
            objinfo.ObjectArray = ObjectTableArrayTwo.ObjectImage
            
            
            var ObjectInfoImageArrayTwo : ObjectInfoTable
            ObjectInfoImageArrayTwo = ObjInfoImageArray[indexPath.row]
            objinfo.SecondAnswerArray = ObjectInfoImageArrayTwo.objImageArray
            
            
            
            /*
             objinfo.objname.text = self.objNameArray[indexPath.row]
             objinfo.objcategoryname.text = self.objCategoriesArray[indexPath.row]
             objinfo.objowner.text = self.objOwnerArray[indexPath.row]
             objinfo.objcategoryicon = self.categoryIconArray[indexPath.row]!
             objinfo.objownericon = self.ownerIconArray[indexPath.row]!
             */
        }
    }

    
    
    
    
    
    
    
    

    
}
