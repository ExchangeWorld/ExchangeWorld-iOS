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
    var imgOwnerarray = [UIImage]()
    var imgOtherarray = [UIImage]()
    var historyOwnerImageURLArray : [String] = []
    var historyOtherImageURLArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
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
        self.userHistoryCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.userExchHistoryOwnerImageURLArrayP.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! userHistoryCollectionViewCell
        
        cell.userOwnerObjImageView.frame = CGRect(x: 0, y: 0, width: collectionView.bounds.size.width*0.5-15, height: collectionView.bounds.size.width*0.5-15)
        
        cell.userOtherObjImageView.frame = CGRect(x: collectionView.bounds.size.width*0.5-15, y: 0, width: collectionView.bounds.size.width*0.5-15, height: collectionView.bounds.size.width*0.5-15)
        
        
        cell.ViewBorderFunction(HorW: false, clear: true, amount: 80, borderWidth: 1)
        cell.userOwnerObjImageView.ViewBorderFunction(HorW: false, clear: true, amount: 50, borderWidth: 1)
        cell.userOtherObjImageView.ViewBorderFunction(HorW: false, clear: true, amount: 50, borderWidth: 1)
        cell.userOwnerObjImageView.image = self.historyOwnerImageArray[indexPath.row]
        cell.userOtherObjImageView.image = self.historyOtherImageArray[indexPath.row]
        cell.userOwnerNameLabel.text = Constants.facebookName
        cell.userOwnerCategoryLabel.text = Constants.userExchHistoryOwnerCategoryArray[indexPath.row]
        cell.userOtherNameLabel.text = Constants.userExchHistoryOtherNameArray[indexPath.row]
        cell.userOtherCategoryLabel.text = Constants.userExchHistoryOtherCategoryArray[indexPath.row]
       
        self.imgOwnerarray = []
        self.imgOtherarray = []
        
        
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
                self.imgOwnerarray.append(UIImage(data: data!)!)
                self.historyOwnerImageArray = self.imgOwnerarray
            }
            else if(kind == 2){
                self.imgOtherarray.append(UIImage(data: data!)!)
                self.historyOtherImageArray = self.imgOtherarray
            }
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
}


