
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

    let categoryImageArray = ["Book", "Textbooks", "3C", "3C_accessories", "Clothes", "Cosmetic", "Accessories", "Food", "Houseware", "Sports", "Games", "Others"] 
    
//    let categoryImageArray = ["Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks", "Textbooks"]
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(HomeObjectCategoryCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setToolbarHidden(true, animated: true)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return categoryImageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeObjectCategoryCollectionViewCell
        
        let cornerRadiusOfCell = cell.bounds.size.height/2
        if cell.categoryImageView.layer.cornerRadius != cornerRadiusOfCell {
            cell.categoryImageView.layer.cornerRadius = cornerRadiusOfCell;
        }
        cell.categoryImageView.image = UIImage(named: self.categoryImageArray[indexPath.row])
    
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
