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
    
    var image1 : UIImage? = nil
    var starImageArray = [UIImage]()
    var imgarray = [UIImage]()
    var starImageURLArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        httpGet(URL: "\(Constants.API_SERVER_URL)/api/user?identity=\(Constants.facebookID)",getType : 1)
        
        httpGet(URL: "\(Constants.API_SERVER_URL)/api/exchange/of/user/all?owner_uid=\(Constants.uid)&token=\(Constants.exwdToken)", getType: 2)
        
        httpGet(URL: "\(Constants.API_SERVER_URL)/api/user/me/goods/queue?token=\(Constants.exwdToken)", getType: 3)
        
        userStarCollectionView.backgroundColor = UIColor(red: 218.0/255.0, green: 218.0/255.0, blue: 218.0/255.0, alpha: 1.0)
        
        starImageURLArray = Constants.userStarImageURLArrayP
  
        if(starImageURLArray.count != 0){
            for i in 1 ... starImageURLArray.count{
                if let checkedUrl = URL(string: starImageURLArray[i-1]) {
                    
                    //downloadImage(url: checkedUrl)
                    getDataFromUrl(url: checkedUrl){(data, response, error) in }
                }
            }
        }
        userStarCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return starImageURLArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserStarCollectionViewCell
        
        cell.ViewBorderFunction(HorW: false, clear: true, amount: 80, borderWidth: 1)
        cell.userStarImageView.image = self.starImageArray[indexPath.row]
        cell.userStarObjNameLabel.text = Constants.userStarObjNameArray[indexPath.row]
        cell.userStarCategoryNameLabel.text = Constants.userStarCategotyArray[indexPath.row]
        cell.userStarOwnerNameLabel.text = Constants.userStarOwnerNameArray[indexPath.row]

        self.imgarray = []
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: collectionView.bounds.size.width-30, height: collectionView.bounds.size.width*0.5-15)
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            
            self.imgarray.append(UIImage(data: data!)!)
            self.starImageArray = self.imgarray
            semaphore.signal()
            }
        task.resume()
        semaphore.wait()
    }
    
    
}
    


