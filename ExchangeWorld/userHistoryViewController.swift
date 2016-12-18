//
//  userHistoryViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/8.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class userHistoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var userHistoryCollectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        userHistoryCollectionView.backgroundColor = UIColor(red: 218.0/255.0, green: 218.0/255.0, blue: 218.0/255.0, alpha: 1.0)
    
        self.userHistoryCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.userExchHistoryOwnerImageURLArrayP.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let categoryOwnerNameChi = categoryEngToChi(categoryArray: Constants.userExchHistoryOwnerCategoryArray)
        let categoryOtherNameChi = categoryEngToChi(categoryArray: Constants.userExchHistoryOtherCategoryArray)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! userHistoryCollectionViewCell
        
        cell.userOwnerObjImageView.frame = CGRect(x: 0, y: 0, width: collectionView.bounds.size.width*0.5-15, height: collectionView.bounds.size.width*0.5-15)
        
        cell.userOtherObjImageView.frame = CGRect(x: collectionView.bounds.size.width*0.5-15, y: 0, width: collectionView.bounds.size.width*0.5-15, height: collectionView.bounds.size.width*0.5-15)
        
        
        cell.ViewBorderFunction(HorW: false, clear: true, amount: 80, borderWidth: 1)
        cell.userOwnerObjImageView.ViewBorderFunction(HorW: false, clear: true, amount: 50, borderWidth: 1)
        cell.userOtherObjImageView.ViewBorderFunction(HorW: false, clear: true, amount: 50, borderWidth: 1)
        cell.userOwnerObjImageView.sd_setImage(with: URL(string: Constants.userExchHistoryOwnerImageURLArrayP[indexPath.row]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
        cell.userOtherObjImageView.sd_setImage(with: URL(string: Constants.userExchHistoryOtherImageURLArrayP[indexPath.row]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
        cell.userOwnerNameLabel.text = Constants.facebookName
        cell.userOwnerCategoryLabel.text = categoryOwnerNameChi[indexPath.row]
        cell.userOtherNameLabel.text = Constants.userExchHistoryOtherNameArray[indexPath.row]
        cell.userOtherCategoryLabel.text = categoryOtherNameChi[indexPath.row]
        
        cell.userOwnerCategoryIcon.image = UIImage(named: Constants.userExchHistoryOwnerCategoryArray[indexPath.row])
        cell.userOtherCategoryIcon.image = UIImage(named: Constants.userExchHistoryOtherCategoryArray[indexPath.row])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width-30, height: (collectionView.bounds.size.width-30)*0.65)
    }
    

}


