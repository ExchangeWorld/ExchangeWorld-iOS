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
    
    let imageArray = [UIImage(named: "羅生門"), UIImage(named: "蚱蜢"), UIImage(named: "賴和全集")]
    let objNameArray = ["羅生門", "蚱蜢", "賴和全集"]
    let objCategoriesArray = ["書籍", "書籍", "書籍"]
    let objOwnerArray = ["萊布尼茲", "特斯拉", "賴和"]
    let categoryIconArray = [UIImage(named: "Book"), UIImage(named: "Book"), UIImage(named: "Book")]
    let ownerIconArray = [UIImage(named: "使用者"), UIImage(named: "使用者"), UIImage(named: "使用者")]
    
    
    
/*
    @IBOutlet var objNameLabel: UILabel!
    @IBOutlet var objCategoryNameLabel: UILabel!
    @IBOutlet var objOwnerLabel: UILabel!
    @IBOutlet var objCategoryIcon: UIImageView!
    @IBOutlet var objOwnerIcon: UIImageView!
*/
    
    var objcollectionviewcell = ObjectCollectionViewCell()
    var objimage = UIImage()
/*
    var objname = UILabel()
    var objcategoryname = UILabel()
    var objowner = UILabel()
    var objcategoryicon = UIImage()
    var objownericon = UIImage()
*/
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //objcollectionviewcell.objImageView.image = self.objimage
/*
        self.objNameLabel.text = self.objname.text
        self.objCategoryNameLabel.text = self.objcategoryname.text
        self.objOwnerLabel.text = self.objowner.text
        self.objCategoryIcon.image = self.objcategoryicon
        self.objOwnerIcon.image = objownericon
*/
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    private struct Storyboard
    {
        static let CellIdentifier = "objectCell"
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("objectCell", forIndexPath: indexPath) as! ObjectCollectionViewCell
        
        //cell.objImageView?.image = self.imageArray[indexPath.row]
    
        
    
        return cell
    }

    
}
