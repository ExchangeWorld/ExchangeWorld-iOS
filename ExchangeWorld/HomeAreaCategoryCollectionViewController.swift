//
//  HomeAreaCategoryCollectionViewController.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/12/10.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

private let reuseIdentifier = "HomeAreaCategoryCollectionViewCell"

class HomeAreaCategoryCollectionViewController: UICollectionViewController {

    let areaImageArray =
        ["01_台灣國", "02_基隆",  "03_台北市", "04_新北市", "05_桃園市", "06新竹市", "07_新竹縣", "08_苗栗縣", "09_台中市", "10_南投縣", "11_彰化縣", "12_雲林縣", "13_嘉義市", "14_嘉義縣", "15_台南市", "16_高雄市", "17_屏東縣", "18_台東縣", "19_花蓮縣", "20_宜蘭縣", "21_澎湖縣", "22_金門縣", "23_連江縣", "24_蘭嶼鄉"]
    
    let areaNameLabelArray =
        ["台灣", "基隆市", "台北市", "新北市", "桃園市", "新竹市", "新竹縣", "苗栗縣", "台中市", "南投縣", "彰化縣", "雲林縣", "嘉義市", "嘉義縣", "台南市", "高雄市", "屏東縣", "台東線", "花蓮縣", "宜蘭縣", "澎湖縣", "金門縣", "連江縣", "蘭嶼鄉"]

    let latitudeArray = [24.137773, 25.131853, 25.048156, 25.048156, 24.989537, 24.801862, 24.801862, 24.570322, 24.137802, 23.826785, 24.081866, 23.745126, 23.479394, 23.479394, 22.997372, 22.639979, 22.669055, 22.793353, 23.993603, 24.754565, 23.570451, 24.450948, 26.143868, 22.048386]

    
    let longtitudeArray = [120.686585, 121.738367, 121.517177, 121.517177, 121.313599, 120.971721, 120.971721, 120.822364, 120.686553, 120.784911, 120.538466, 120.416875, 120.441138, 120.441138, 120.212579, 120.302161, 120.485953, 121.122750, 121.601055, 121.758378, 119.581538, 118.376608, 119.927667, 121.548090]
 
    let zoomArray = [6, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 6, 6, 6, 6]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return areaImageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeAreaCategoryCollectionViewCell
    
        cell.areaImageView.image = UIImage(named: self.areaImageArray[indexPath.row])
        cell.areaNameLabel.text = self.areaNameLabelArray[indexPath.row]
        
        // Configure the cell
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        if segueIdentifier == "AreaToMap" {
            guard let detailViewController = segue.destination as? HomeMapViewController else {
                return
            }
            guard let cell = sender as? UICollectionViewCell else {
                return
            }
            let indexPath = self.collectionView?.indexPath(for: cell)
            
            detailViewController.myLatitude = self.latitudeArray[indexPath!.row]
            detailViewController.myLongtitude = self.longtitudeArray[(indexPath?.row)!]
            detailViewController.myZoom = self.zoomArray[(indexPath?.row)!]
        }
    }


}
