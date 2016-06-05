//
//  HomeAreaCategoryCollectionViewController.swift
//  ExchangeWorld
//
//  Created by 盧與明 on 2016/5/30.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit

class HomeAreaCategoryCollectionViewController: UICollectionViewController {

    @IBOutlet weak var homeAreaCategoryCollectionView: UICollectionView!

    let areaImageArray =
        ["01_台灣國", "02_基隆",  "03_台北市", "04_新北市", "05_桃園市", "06新竹市", "07_新竹縣", "08_苗栗縣", "09_台中市", "10_南投縣", "11_彰化縣",     "12_雲林縣", "13_嘉義市", "14_嘉義縣", "15_台南市", "16_高雄市", "17_屏東縣", "18_台東縣", "19_花蓮縣", "20_宜蘭縣", "21_澎湖縣", "22_金門縣", "23_連江縣", "24_蘭嶼鄉", "25_綠島鄉"]

    let areaNameLabelArray =
        ["台灣", "基隆市", "台北市", "新北市", "桃園市", "新竹市", "新竹縣", "苗栗縣", "台中市", "南投縣", "彰化縣", "雲林縣", "嘉義市", "嘉義縣", "台南市",   "高雄市", "屏東縣", "台東線", "花蓮縣", "宜蘭縣", "澎湖縣", "金門縣", "連江縣", "蘭嶼鄉", "綠島鄉"]
    
    private let leftAndRightPaddings: CGFloat = 50.0
    private let numberOfItemsPerRow: CGFloat = 3.0
    private let heightAdjustment: CGFloat = 30.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (CGRectGetWidth(collectionView!.frame)-leftAndRightPaddings) / numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width+heightAdjustment)
        
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "HomeAreaCategoryCollectionViewCell")

    }



    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return areaImageArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HomeAreaCategoryCollectionViewCell", forIndexPath: indexPath) as! HomeAreaCategoryCollectionViewCell
    
        cell.areaImageView?.image = UIImage(named: self.areaImageArray[indexPath.row])
        cell.areaNameLabel.text = self.areaNameLabelArray[indexPath.row]
    
        return cell
    }



}
