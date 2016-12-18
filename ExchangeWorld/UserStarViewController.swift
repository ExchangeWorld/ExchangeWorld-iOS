//
//  UserStarViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/4.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class UserStarViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var userStarCollectionView: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        httpGet(URL: "\(Constants.API_SERVER_URL)/api/user?identity=\(Constants.facebookID)",getType : 1)
        
        httpGet(URL: "\(Constants.API_SERVER_URL)/api/exchange/of/user/all?owner_uid=\(Constants.uid)&token=\(Constants.exwdToken)", getType: 2)
        
        httpGet(URL: "\(Constants.API_SERVER_URL)/api/user/me/goods/queue?token=\(Constants.exwdToken)", getType: 3)
        
        userStarCollectionView.backgroundColor = UIColor(red: 218.0/255.0, green: 218.0/255.0, blue: 218.0/255.0, alpha: 1.0)
             
        userStarCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.userStarImageURLArrayP.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let categoryNameChi = categoryEngToChi(categoryArray: Constants.userStarCategotyArray)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserStarCollectionViewCell
        
        cell.ViewBorderFunction(HorW: false, clear: true, amount: 80, borderWidth: 1)
        cell.userStarImageView.sd_setImage(with: URL(string: Constants.userStarImageURLArrayP[indexPath.row]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
        cell.userStarObjNameLabel.text = Constants.userStarObjNameArray[indexPath.row]
        cell.userStarCategoryNameLabel.text = categoryNameChi[indexPath.row]
        cell.userStarOwnerNameLabel.text = Constants.userStarOwnerNameArray[indexPath.row]
        cell.userStarImageView.tag = indexPath.row

        cell.userStarCategoryIcon.image = UIImage(named: Constants.userStarCategotyArray[indexPath.row])
        
        return cell
    }
    
   
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: collectionView.bounds.size.width-30, height: collectionView.bounds.size.width*0.5-15)
    }

    
}
    


