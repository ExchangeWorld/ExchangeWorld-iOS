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
    
    var historyOwnerImageArray = [UIImage]()
    var historyOtherImageArray = [UIImage]()
    var historyOwnerImageURLArray : [String] = []
    var historyOtherImageURLArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userHistoryCollectionView.backgroundColor = UIColor(red: 218.0/255.0, green: 218.0/255.0, blue: 218.0/255.0, alpha: 1.0)
        
        historyOwnerImageURLArray = Constants.userExchHistoryOwnerImageURLArrayP
        historyOtherImageURLArray = Constants.userExchHistoryOtherImageURLArrayP
        
        if(historyOwnerImageURLArray.count != 0){
            for i in 1 ... historyOwnerImageURLArray.count{
                if let checkUrl1 = URL(string: historyOwnerImageURLArray[i-1]){
                    
                    getDataFromUrl(url: checkUrl1, kind: 1){(data, response, error) in }
                }
                if let checkUrl2 = URL(string: historyOtherImageURLArray[i-1]){
                    
                    getDataFromUrl(url: checkUrl2, kind: 2){(data, response, error) in }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.userExchHistoryOwnerImageURLArrayP.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! userHistoryCollectionViewCell
        
        cell.userOwnerObjImageView.frame = CGRect(x: 0, y: 0, width: collectionView.bounds.size.width*0.5-14, height: collectionView.bounds.size.width*0.5-15)
        
        cell.userOtherObjImageView.frame = CGRect(x: collectionView.bounds.size.width*0.5-15, y: 0, width: collectionView.bounds.size.width*0.5-15, height: collectionView.bounds.size.width*0.5-15)
//
//        cell.userOwnerIcon.frame = CGRect(x: 15, y: collectionView.bounds.size.width*0.5-7, width: 19, height: 19)
//        
//        cell.userOwnerCategoryIcon.frame = CGRect(x: 15, y: collectionView.bounds.size.width*0.5+17, width: 19, height: 19)
//        
//        cell.historyExchIcon.frame = CGRect(x: collectionView.bounds.size.width*0.5-30, y: collectionView.bounds.size.width*0.5-0.5, width: 30, height: 30)
//        
//        cell.userOwnerNameLabel.frame = CGRect(x: collectionView.bounds.size.width*0.5-15, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        
        
        
        cell.userOwnerObjImageView.image = self.historyOwnerImageArray[indexPath.row]
        cell.userOtherObjImageView.image = self.historyOtherImageArray[indexPath.row]
        cell.userOwnerNameLabel.text = Constants.facebookName
        cell.userOwnerCategoryLabel.text = Constants.userExchHistoryOwnerCategoryArray[indexPath.row]
        cell.userOtherNameLabel.text = Constants.userExchHistoryOtherNameArray[indexPath.row]
        cell.userOtherCategoryLabel.text = Constants.userExchHistoryOtherCategoryArray[indexPath.row]
       
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width-30, height: (collectionView.bounds.size.width-30)*0.65)
    }
    
    func getDataFromUrl(url: URL, kind: Int, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if(kind == 1){
                self.historyOwnerImageArray.append(UIImage(data: data!)!)
            }
            else if(kind == 2){
                self.historyOtherImageArray.append(UIImage(data: data!)!)
            }
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
}


