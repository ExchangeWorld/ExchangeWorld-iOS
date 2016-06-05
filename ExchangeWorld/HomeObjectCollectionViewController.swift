//
//  HomeObjectCollectionViewController.swift
//  ExchangeWorld
//
//  Created by 盧與明 on 2016/5/30.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit


class HomeObjectCollectionViewController: UICollectionViewController {

    @IBOutlet var homeObjectCollectionView: UICollectionView!
    
    var categoryName: String = ""
    var thisCategory: Category? {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    var categoryData: ExchangeWorldCategoryDataSource? {
        didSet {
            guard let categoryData = self.categoryData else {
                self.collectionView?.reloadData()
                return
            }
            categoryData.fetch{ (resultObjects: [Object]?) in
                guard let objects = resultObjects else {
                    let message = "Failed to fetch objects for category: \(self.categoryName)"
                    let alertController = UIAlertController(title: message, message: nil, preferredStyle: .Alert)
                    let alertOK = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alertController.addAction(alertOK)
                    self.presentViewController(alertController, animated: true, completion: nil)
                    return
                }
                self.thisCategory = Category(name: categoryData.categoryName, objects: objects)
            }
        }
        
    }
    
    private let leftAndRightPaddings: CGFloat = 20.0
    private let heightAdjustment: CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryData = ExchangeWorldCategoryDataSource(categoryName: categoryName)
        
        let width = CGRectGetWidth(collectionView!.frame)-leftAndRightPaddings
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, (width*0.5))

        self.navigationController?.navigationBarHidden = false
//        Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "HomeObjectCollectionViewCell")

    }


    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
//        someOptional != nil ? someOptional! : defaultValue ---> someOptional ?? defaultValue
        return self.thisCategory?.objects.count ?? 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HomeObjectCollectionViewCell", forIndexPath: indexPath) as! HomeObjectCollectionViewCell
        let object = self.thisCategory!.objects[indexPath.row]
        
        cell.objNameLabel.text = object.name
        cell.objCategoryNameLabel.text = object.category
        cell.objOwnerNameLabel.text = object.owner.name
//        cell.objImageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: object.photo_path)!)!) 

        cell.objImageView.image = UIImage(named: self.categoryName)
        cell.objCategoryImageView.image = UIImage(named: self.categoryName)
        cell.objOwnerImageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: object.owner.photo_path)!)!)
    
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        if segueIdentifier == "ShowObjectDetail" {
            guard let detailViewController = segue.destinationViewController as? ObjectInfoViewController else {
                return
            }
            
            guard let cell = sender as? UICollectionViewCell else {return}
            let indexPath = self.collectionView?.indexPathForCell(cell)
            
            detailViewController.object = self.thisCategory!.objects[indexPath!.row]
        }
        
    }
    

}
