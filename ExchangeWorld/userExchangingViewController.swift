//
//  userExchangingViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/9.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class userExchangingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var userExchangingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        userExchangingCollectionView.backgroundColor = UIColor(red: 218.0/255.0, green: 218.0/255.0, blue: 218.0/255.0, alpha: 1.0)

        userExchangingCollectionView.reloadData()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.userExchangingOwnerImageURLArrayP.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let categoryOwnerNameChi = categoryEngToChi(categoryArray: Constants.userExchangingOwnerCategoryArray)
        let categoryOtherNameChi = categoryEngToChi(categoryArray: Constants.userExchangingOtherCategoryArray)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! userExchangingCollectionViewCell
        
        cell.ViewBorderFunction(HorW: false, clear: true, amount: 80, borderWidth: 1)
        cell.userExchangingOwnerObjImageView.sd_setImage(with: URL(string: Constants.userExchangingOwnerImageURLArrayP[indexPath.row]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
        cell.userExchangingOtherObjImageView.sd_setImage(with: URL(string: Constants.userExchangingOtherImageURLArrayP[indexPath.row]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])


        cell.userExchangingOwnerObjImageView.ViewBorderFunction(HorW: false,clear: false, amount: 10, borderWidth: 1.2)
        cell.userExchangingOtherObjImageView.ViewBorderFunction(HorW: false,clear: false, amount: 10, borderWidth: 1.2)
        cell.userExchangingOwnerView.ViewBorderFunction(HorW: false,clear: true, amount: 10, borderWidth: 1.2)
        cell.userExchangingOtherView.ViewBorderFunction(HorW: false,clear: true, amount: 10, borderWidth: 1.2)
        
        cell.userExchangingOwnerCategoryLabel.text = categoryOwnerNameChi[indexPath.row]
        cell.userExchangingOwnerCategoryIcon.image = UIImage(named: Constants.userExchangingOwnerCategoryArray[indexPath.row])
        cell.userExchangingOwnerNameLabel.text = Constants.facebookName
        
        cell.userExchangingOwnerObjLabel.text = Constants.userExchangingOwnerObjNameArray[indexPath.row]
        cell.userExchangingOwnerDescriptionLabel.text = Constants.userExchangingOwnerObjDescription[indexPath.row]
 
        
        cell.userExchangingOtherCategoryLabel.text = categoryOtherNameChi[indexPath.row]
        cell.userExchangingOtherCategoryIcon.image = UIImage(named: Constants.userExchangingOtherCategoryArray[indexPath.row])
        cell.userExchangingOtherNameLabel.text = Constants.userExchangingOtherNameArray[indexPath.row]
        cell.userExchangingOtherObjNameLabel.text = Constants.userExchangingOtherObjNameArray[indexPath.row]
        cell.userExchangingOtherDescriptionLabel.text = Constants.userExchangingOtherObjDescription[indexPath.row]
        cell.userExchangingExchIDLabel.text = String(Constants.userExchangingEIDArray[indexPath.row])
        cell.userExchangingExchIDLabel.isHidden = true
        
        
        cell.userExchangingOwnerCategoryLabel.LabelWidthLayoutFunction(constant: (cell.userExchangingOwnerView.frame.width-44)*0.8)
        cell.userExchangingOwnerNameLabel.LabelWidthLayoutFunction(constant: (cell.userExchangingOwnerView.frame.width-44)*0.8)
        
        cell.userExchangingOtherCategoryLabel.LabelWidthLayoutFunction(constant: (cell.userExchangingOwnerView.frame.width-44)*0.8)
        cell.userExchangingOtherNameLabel.LabelWidthLayoutFunction(constant: (cell.userExchangingOwnerView.frame.width-44)*0.8)
        
        
        return cell
    }
    
    @IBAction func userExchangeButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "系統提示", message: "已發送交易確認訊息", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "確認", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width-30, height: (collectionView.bounds.size.width-30)*0.9)
    }

}

extension UIView{
    
    func ViewBorderFunction(HorW: Bool, clear: Bool, amount: CGFloat, borderWidth: CGFloat){
        var View:UIView = self
        if(HorW == true){
            View.layer.cornerRadius = View.frame.height/amount
        }
        else{
            View.layer.cornerRadius = View.frame.width/amount
        }
        
        View.layer.borderColor = UIColor(red: 125/255, green: 116/255, blue: 113/255, alpha: 1).cgColor
        if(clear == true){
            View.layer.borderColor = UIColor.clear.cgColor
        }
        View.layer.borderWidth = borderWidth
        View.clipsToBounds = true
    }
}

extension UILabel{
    func LabelWidthLayoutFunction(constant: CGFloat){
        var Label: UILabel = self
        let widthConstraint1 = NSLayoutConstraint(item: Label, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: constant)
        Label.addConstraint(widthConstraint1)
    }
}


