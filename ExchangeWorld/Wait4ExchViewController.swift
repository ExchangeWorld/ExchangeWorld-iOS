//
//  Wait4ExchViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/8.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class Wait4ExchViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    
    @IBOutlet weak var wait4ExchCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        wait4ExchCollectionView.backgroundColor = UIColor(red: 218.0/255.0, green: 218.0/255.0, blue: 218.0/255.0, alpha: 1.0)
        
        wait4ExchCollectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.userWait4ExchImageURLArrayP.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let categoryNameChi = categoryEngToChi(categoryArray: Constants.userWait4ExchCategoryArray)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Wait4ExchCollectionViewCell
        
        cell.ViewBorderFunction(HorW: false, clear: true, amount: 80, borderWidth: 1)
        cell.wait4ExchImageView.sd_setImage(with: URL(string: Constants.userWait4ExchImageURLArrayP[indexPath.row]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
        cell.wait4ExchObjNameLabel.text = Constants.userWait4ExchObjNameArray[indexPath.row]
        cell.wait4ExchCategoryNameLabel.text = categoryNameChi[indexPath.row]
        cell.wait4ExchOwnerNameLabel.text = Constants.facebookName
        
        cell.wait4ExchCategoryIcon.image = UIImage(named: Constants.userWait4ExchCategoryArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width-30, height: collectionView.bounds.size.width*0.5-15)
    }


}
