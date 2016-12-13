
//  HomeObjectCategoryCollectionViewController.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/10/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

private let reuseIdentifier = "HomeObjectCategoryCollectionViewCell"

class HomeObjectCategoryCollectionViewController: UICollectionViewController {

    @IBOutlet var homeObjectCategoryCollectionView: UICollectionView!

    let categoryImageArray = ["Books", "Textbooks", "3C", "3C_accessories", "Clothes", "Cosmetic", "Accessories", "Food", "Houseware", "Sports", "Games", "Others"]
    
    let categortNameArray = ["書籍", "教科書", "3C產品", "3C配件", "服飾", "美妝用品", "穿搭配件", "食物", "家庭用品", "運動用品", "電玩遊戲", "其它"]
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(HomeObjectCategoryCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryImageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeObjectCategoryCollectionViewCell
        
//        let cornerRadiusOfCell = cell.bounds.size.height/2
//        if cell.categoryImageView.layer.cornerRadius != cornerRadiusOfCell {
//            cell.categoryImageView.layer.cornerRadius = cornerRadiusOfCell;
//        }
        cell.categoryImageView.image = UIImage(named: self.categoryImageArray[indexPath.row])
        cell.categoryNameLabel.text = self.categortNameArray[indexPath.row]
    
        // Configure the cell
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        if segueIdentifier == "showCategoryObjects" {
            guard let detailViewController = segue.destination as? HomeObjectCollectionViewController else {
                return
            }
            guard let cell = sender as? UICollectionViewCell else {
                return
            }
            let indexPath = self.collectionView?.indexPath(for: cell)
            
            detailViewController.categoryName = self.categoryImageArray[indexPath!.row]
        }
        
    }


}
