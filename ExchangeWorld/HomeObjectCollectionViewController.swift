//
//  HomeObjectCollectionViewController.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/10/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

private let reuseIdentifier = "HomeObjectCollectionViewCell"

class HomeObjectCollectionViewController: UICollectionViewController {

    @IBOutlet var homeObjectCollectionView: UICollectionView!

    var categoryName: String = ""
    var thisCategory: Category? {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
    var categoryData: ExchangeWorldCategoryDataSource? {
        didSet{
            guard let categoryData = self.categoryData else {
                self.collectionView?.reloadData()
                return
            }
            categoryData.fetch { (resultObjects: [Object]?) in
                guard let objects = resultObjects else {
                    let message = "Failed to fetch objects of category: \(self.categoryName)"
                    let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
                    let alertOK = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(alertOK)
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
                self.thisCategory = Category(name: self.categoryName, objects: objects)
                print("abc")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryData = ExchangeWorldCategoryDataSource(categoryName: categoryName)
        
        self.navigationController?.isNavigationBarHidden = false
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(HomeObjectCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.thisCategory?.objects.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeObjectCollectionViewCell
        let object = self.thisCategory!.objects[indexPath.row]
        print(object)
        
        let rawPath = object.photo_path
        let leftIndexToStrip = rawPath.index(rawPath.startIndex, offsetBy: 2)
        let rightIndexToStrip = rawPath.index(rawPath.endIndex, offsetBy: -2)
        let path = rawPath.substring(with: leftIndexToStrip..<rightIndexToStrip)
        print(path)
        
        // Simpler
        if let url = URL(string: path), let data = try? Data(contentsOf: url) {
            cell.objImageView.image = UIImage(data: data)
        }
        cell.objNameLabel.text = object.name
        cell.objCategoryLabel.text = object.category
        cell.objOwnerLabel.text = object.owner.name
        
        // Configure the cell
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else{
            return
        }
        
        if segueIdentifier == "showObjectDetail" {
            guard let detailViewController = segue.destination as? ObjectInfoViewController else {
                return
            }
            guard let cell = sender as? UICollectionViewCell else {
                return
            }
            let indexPath = self.collectionView?.indexPath(for: cell)
            
            detailViewController.object = self.thisCategory!.objects[indexPath!.row]
        }
    }

}
