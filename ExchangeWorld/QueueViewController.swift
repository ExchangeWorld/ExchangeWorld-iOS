//
//  QueueViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class QueueViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.userWait4ExchObjNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let categoryNameChi = categoryEngToChi(categoryArray: Constants.userWait4ExchCategoryArray)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "wait4ExchCell", for: indexPath) as! QueueCollectionViewCell
        
        
        cell.queueButton.tag = indexPath.row
        
        cell.wait4ExchObjImageView.sd_setImage(with: URL(string: Constants.userWait4ExchImageURLArrayP[indexPath.row]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
        cell.wait4ExchObjNameLabel.text = Constants.userWait4ExchObjNameArray[indexPath.row]
        cell.wait4ExchObjCategoryIcon.image = UIImage(named: Constants.userWait4ExchCategoryArray[indexPath.row])
        cell.wait4ExchObjCategoryNameLabel.text = categoryNameChi[indexPath.row]
        cell.wait4ExchObjOwnerNameLabel.text = Constants.facebookName
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width-40, height: collectionView.bounds.size.width*0.5-30+40)
    }
    @IBAction func queueMessageAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "系統提示", message: "已排", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "確認", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }

    @IBAction func doesntWant2QueueYetButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
