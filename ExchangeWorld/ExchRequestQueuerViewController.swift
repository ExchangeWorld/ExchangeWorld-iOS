//
//  ExchRequestQueuerViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/17.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class ExchRequestQueuerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var doesntWant2ExchYetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doesntWant2ExchYetButton.ViewBorderFunction(HorW: false, clear: true, amount: 10, borderWidth: 1)
        
        
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.userExchRequestQueuerObjNameArray[Constants.whichObjCount].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let categoryNameChi = categoryEngToChi(categoryArray: Constants.userExchRequestQueuerCategoryArray[Constants.whichObjCount])
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "queuerCell", for: indexPath) as! ExchRequestQueuerCollectionViewCell
        cell.userExchConfirmedButton.tag = indexPath.row
        
        cell.userExchQueuerImage.sd_setImage(with: URL(string: Constants.userExchRequestQueuerImageURLArrayP[Constants.whichObjCount][indexPath.row]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
        cell.userExchQueuerObjNameLabel.text = Constants.userExchRequestQueuerObjNameArray[Constants.whichObjCount][indexPath.row]
        cell.userExchQueuerCategoryIcon.image = UIImage(named: Constants.userExchRequestQueuerCategoryArray[Constants.whichObjCount][indexPath.row])
        cell.userExchQueuerCategoryLabel.text = categoryNameChi[indexPath.row]
        cell.userExchQueuerNameLabel.text = Constants.userExchRequestQueuerNameArray[Constants.whichObjCount][indexPath.row]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width-60, height: collectionView.bounds.size.width*0.5-30+40)
    }
    
   
    
    @IBAction func confirmExchButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "系統提示", message: "您的物品正在和對方交換", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "確認", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func doesntWant2ExchYetAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    


}
