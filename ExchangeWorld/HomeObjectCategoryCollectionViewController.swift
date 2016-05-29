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
    //private let leftAndRightPaddings: CGFloat = 80.0
   
    private let numberOfItemsPerRow: CGFloat = 2.0
    private let heightAdjustment: CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftAndRightPaddings = self.view.frame.width*83/377
        let width = (CGRectGetWidth(collectionView!.frame)-leftAndRightPaddings) / numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width)
        
        ocImageArray = ["3C", "Book", "Clothes", "Makeup", "Textbook", "Others"]
        
        ObjectArray = [
        ObjectTable(ObjectImage: ["羅生門", "賴和全集", "蚱蜢"],ObjectName:["羅生門", "賴和全集", "蚱蜢"],ObjectCategoryIcon:["3Cicon","3Cicon","3Cicon"],ObjectOwnerIcon: ["usericon","usericon","usericon"],ObjectCategoryName: ["3C產品","3C產品","3C產品"], ObjectOwnerName: ["萊布尼茲","賴和","特斯拉"]),
        ObjectTable(ObjectImage: ["羅生門", "蚱蜢", "賴和全集"],ObjectName:["羅生門", "蚱蜢", "賴和全集"],ObjectCategoryIcon:["Bookicon","Bookicon","Bookicon"],ObjectOwnerIcon: ["usericon","usericon","usericon"],ObjectCategoryName: ["書籍","書籍","書籍"], ObjectOwnerName: ["萊布尼茲","特斯拉","賴和"]),
        ObjectTable(ObjectImage: ["蚱蜢", "羅生門", "賴和全集"],ObjectName:["蚱蜢", "羅生門", "賴和全集"],ObjectCategoryIcon:["Clothesicon","Clothesicon","Clothesicon"],ObjectOwnerIcon: ["usericon","usericon","usericon"],ObjectCategoryName: ["流行服飾","流行服飾","流行服飾"], ObjectOwnerName: ["特斯拉","萊布尼茲","賴和"]),
        ObjectTable(ObjectImage: ["蚱蜢", "賴和全集", "羅生門"],ObjectName:["蚱蜢", "賴和全集", "羅生門"],ObjectCategoryIcon:["Mackupicon","Makeupicon","Makeupicon"],ObjectOwnerIcon: ["usericon","usericon","usericon"],ObjectCategoryName: ["美妝用品","美妝用品","美妝用品"], ObjectOwnerName: ["特斯拉","賴和","萊布尼茲"]),
        ObjectTable(ObjectImage: ["賴和全集", "蚱蜢", "羅生門"],ObjectName:["賴和全集", "蚱蜢", "羅生門"],ObjectCategoryIcon:["Textbookicon","Textbookicon","Textbookicon"],ObjectOwnerIcon: ["usericon","usericon","usericon"],ObjectCategoryName: ["教科書","教科書","教科書"], ObjectOwnerName: ["賴和","特斯拉","萊布尼茲"]),
        ObjectTable(ObjectImage: ["賴和全集", "羅生門", "蚱蜢"],ObjectName:["賴和全集", "羅生門", "蚱蜢"],ObjectCategoryIcon:["Othersicon","Othersicon","Othersicon"],ObjectOwnerIcon: ["usericon","usericon","usericon"],ObjectCategoryName: ["其他","其他","其他"], ObjectOwnerName: ["賴和","萊布尼茲","特斯拉",])]
        
        ObjInfoImageArray = [
        ObjectInfoTable(objImageArray:["羅生門", "賴和全集", "蚱蜢"],objNameArray:["羅生門", "賴和全集", "蚱蜢"],objDescriptionArray:["羅生門的描述","賴和全集的描述","蚱蜢的描述"]),
        ObjectInfoTable(objImageArray:["羅生門", "蚱蜢", "賴和全集"],objNameArray:["羅生門", "蚱蜢", "賴和全集"],objDescriptionArray:["羅生門的描述","蚱蜢的描述","賴和全集的描述"]),
        ObjectInfoTable(objImageArray:["蚱蜢", "羅生門", "賴和全集"],objNameArray:["蚱蜢", "羅生門", "賴和全集"],objDescriptionArray:["蚱蜢的描述","羅生門的描述","賴和全集的描述"]),
        ObjectInfoTable(objImageArray:["蚱蜢", "賴和全集", "羅生門"],objNameArray:["蚱蜢", "賴和全集", "羅生門"],objDescriptionArray:["蚱蜢的描述","賴和全集的描述","羅生門的描述"]),
        ObjectInfoTable(objImageArray:["賴和全集", "蚱蜢", "羅生門"],objNameArray:["賴和全集", "蚱蜢", "羅生門"],objDescriptionArray:["賴和全集的描述","蚱蜢的描述","羅生門的描述"]),
        ObjectInfoTable(objImageArray:["賴和全集", "羅生門", "蚱蜢"],objNameArray:["賴和全集", "羅生門", "蚱蜢"],objDescriptionArray:["賴和全集的描述","羅生門的描述","蚱蜢的描述"])]
        
//        for i in 1 ... ObjectArray.count{
//            ObjInfoImageArray[i].objImageArray = ObjectArray[i].ObjectImage
//        }
        
        //print (ObjInfoImageArray)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
            objinfo.ObjectImageArray = ObjectTableArrayTwo.ObjectImage
            objinfo.ObjectNameArray = ObjectTableArrayTwo.ObjectName
            objinfo.ObjectCategoryIconArray = ObjectTableArrayTwo.ObjectCategoryIcon
            objinfo.ObjectOwnerIconArray = ObjectTableArrayTwo.ObjectOwnerIcon
            objinfo.ObjectCategoryNameArray = ObjectTableArrayTwo.ObjectCategoryName
            objinfo.ObjectOwnerNameArray = ObjectTableArrayTwo.ObjectOwnerName
            //print(ObjectTableArrayTwo)
            //print(ObjectArray)
            
            
            var ObjectInfoTableArrayTwo : ObjectInfoTable
            ObjectInfoTableArrayTwo = ObjInfoImageArray[indexPath.row]
            objinfo.ObjectInfoImageArray = ObjectInfoTableArrayTwo.objImageArray
            objinfo.ObjectInfoNameArray = ObjectInfoTableArrayTwo.objNameArray
            objinfo.ObjectInfoDescriptionArray = ObjectInfoTableArrayTwo.objDescriptionArray
            
            
            
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
