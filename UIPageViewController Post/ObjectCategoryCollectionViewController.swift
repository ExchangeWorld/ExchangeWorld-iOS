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

    @IBOutlet var ObjectCategoryCollectionView: UICollectionView!
    
    var ocImageArray = [String]()
    var SecondArray = [SecondTable]()
    let objectcategories = ObjectCategories()
    
    
    let objNameArray = ["羅生門", "蚱蜢", "賴和全集"]
    let objCategoriesArray = ["書籍", "書籍", "書籍"]
    let objOwnerArray = ["萊布尼茲", "特斯拉", "賴和"]
    let categoryIconArray = [UIImage(named: "Book"), UIImage(named: "Book"), UIImage(named: "Book")]
    let ownerIconArray = [UIImage(named: "使用者"), UIImage(named: "使用者"), UIImage(named: "使用者")]

    
    // for dynamic column
    private let leftAndRightPaddings: CGFloat = 80.0
    private let numberOfItemsPerRow: CGFloat = 2.0
    private let heightAdjustment: CGFloat = 100.0
    
    
    
    //MARK : - View controller life cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        ocImageArray = ["3C", "Book", "Clothes", "Makeup", "Textbook", "Others"]
        
        SecondArray = [
        SecondTable(ObjectImage: ["羅生門", "賴和全集", "蚱蜢"]),
        SecondTable(ObjectImage: ["羅生門", "蚱蜢", "賴和全集"]),
        SecondTable(ObjectImage: ["蚱蜢", "羅生門", "賴和全集"]),
        SecondTable(ObjectImage: ["蚱蜢", "賴和全集", "羅生門"]),
        SecondTable(ObjectImage: ["賴和全集", "蚱蜢", "羅生門"]),
        SecondTable(ObjectImage: ["賴和全集", "羅生門", "蚱蜢"])]
        
        
       
        
        
        
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
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ocImageArray.count
    }
    
    

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ObjectCategoryCell", forIndexPath: indexPath) as! ObjectCategoryCollectionViewCell
    
        cell.categoryImageView?.image = UIImage(named : self.ocImageArray[indexPath.row])
        
        return cell
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showObjects", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showObjects"{
            
            
            
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let objinfo = segue.destinationViewController as! ObjectCollectionViewController
            
            var SecondTableArrayTwo : SecondTable
            
            SecondTableArrayTwo = SecondArray[indexPath.row]
            
            objinfo.SecondArray = SecondTableArrayTwo.ObjectImage
            
      
            
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
























