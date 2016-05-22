//
//  HomeAreaCategoryTabViewController.swift
//  ExchangeWorld
//
//  Created by 盧與明 on 2016/5/16.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit

class HomeAreaCategoryCollectionViewController: UICollectionViewController {
    
    
    @IBOutlet var areaCollectionView: UICollectionView!
    
    var areaImageArray = [String]()
    
    
    private let leftAndRightPaddings: CGFloat = 50.0
    private let numberOfItemsPerRow: CGFloat = 3.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (CGRectGetWidth(collectionView!.frame)-leftAndRightPaddings) / numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width)
        
        
        areaImageArray = ["01_台灣國", "02_基隆", "03_台北市", "04_新北市", "05_桃園市", "06新竹市", "07_新竹縣", "08_苗栗縣", "09_台中市", "10_南投縣", "11_彰化縣", "12_雲林縣", "13_嘉義市", "14_嘉義縣", "15_台南市", "16_高雄市", "17_屏東縣", "18_台東線", "19_花蓮縣", "20_宜蘭縣", "21_澎湖縣", "22_金門縣", "23_連江縣", "24_蘭嶼鄉", "25_綠島鄉",]

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return areaImageArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AreaCategoryCell", forIndexPath: indexPath) as! HomeAreaCategoryCollectionViewCell
        
        cell.areaImageView?.image = UIImage(named : self.areaImageArray[indexPath.row])
        
        return cell
    }


}
