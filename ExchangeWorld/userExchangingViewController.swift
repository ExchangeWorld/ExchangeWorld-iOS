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
    
    
    var exchangingOwnerImageArray = [UIImage]()
    var exchangingOtherImageArray = [UIImage]()
    var exchangingOwnerImageURLArray : [String] = []
    var exchangingOtherImageURLArray : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userExchangingCollectionView.backgroundColor = UIColor(red: 218.0/255.0, green: 218.0/255.0, blue: 218.0/255.0, alpha: 1.0)
        
        exchangingOwnerImageURLArray = Constants.userExchangingOwnerImageURLArrayP
        exchangingOtherImageURLArray = Constants.userExchangingOtherImageURLArrayP
        
        if(exchangingOwnerImageURLArray.count != 0){
            for i in 1 ... exchangingOwnerImageURLArray.count{
                if let checkUrl1 = URL(string: exchangingOwnerImageURLArray[i-1]){
                    
                    getDataFromUrl(url: checkUrl1, kind: 1){(data, response, error) in }
                }
                if let checkUrl2 = URL(string: exchangingOtherImageURLArray[i-1]){
                    
                    getDataFromUrl(url: checkUrl2, kind: 2){(data, response, error) in }
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.userExchangingOwnerImageURLArrayP.count
        //return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! userExchangingCollectionViewCell
        
        cell.ViewBorderFunction(HorW: false, clear: true, amount: 80, borderWidth: 1)
        cell.userExchangingOwnerObjImageView.image = self.exchangingOwnerImageArray[indexPath.row]
        cell.userExchangingOtherObjImageView.image = self.exchangingOtherImageArray[indexPath.row]

        cell.userExchangingOwnerObjImageView.ViewBorderFunction(HorW: false,clear: false, amount: 10, borderWidth: 1.2)
        cell.userExchangingOtherObjImageView.ViewBorderFunction(HorW: false,clear: false, amount: 10, borderWidth: 1.2)
        cell.userExchangingOwnerView.ViewBorderFunction(HorW: false,clear: true, amount: 10, borderWidth: 1.2)
        cell.userExchangingOtherView.ViewBorderFunction(HorW: false,clear: true, amount: 10, borderWidth: 1.2)
        
        cell.userExchangingOwnerCategoryLabel.text = Constants.userExchangingOwnerCategoryArray[indexPath.row]
        cell.userExchangingOwnerNameLabel.text = Constants.facebookName
        
        cell.userExchangingOwnerObjLabel.text = Constants.userExchangingOwnerObjNameArray[indexPath.row]
        cell.userExchangingOwnerDescriptionLabel.text = Constants.userExchangingOwnerObjDescription[indexPath.row]
 
        
        cell.userExchangingOtherCategoryLabel.text = Constants.userExchangingOtherCategoryArray[indexPath.row]
        cell.userExchangingOtherNameLabel.text = Constants.userExchangingOtherNameArray[indexPath.row]
        cell.userExchangingOtherObjNameLabel.text = Constants.userExchangingOtherObjNameArray[indexPath.row]
        cell.userExchangingOtherDescriptionLabel.text = Constants.userExchangingOtherObjDescription[indexPath.row]
        
        
        
        cell.userExchangingOwnerCategoryLabel.LabelWidthLayoutFunction(constant: (cell.userExchangingOwnerView.frame.width-44)*0.8)
        cell.userExchangingOwnerNameLabel.LabelWidthLayoutFunction(constant: (cell.userExchangingOwnerView.frame.width-44)*0.8)
        
        cell.userExchangingOtherCategoryLabel.LabelWidthLayoutFunction(constant: (cell.userExchangingOwnerView.frame.width-44)*0.8)
        cell.userExchangingOtherNameLabel.LabelWidthLayoutFunction(constant: (cell.userExchangingOwnerView.frame.width-44)*0.8)
    
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width-30, height: (collectionView.bounds.size.width-30)*0.9)
    }
    
    func getDataFromUrl(url: URL, kind: Int, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if(kind == 1){
                self.exchangingOwnerImageArray.append(UIImage(data: data!)!)
            }
            else if(kind == 2){
                self.exchangingOtherImageArray.append(UIImage(data: data!)!)
            }
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
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


