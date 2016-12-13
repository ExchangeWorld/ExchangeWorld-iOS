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
    
    var image1 : UIImage? = nil
    var wait4ExchImageArray = [UIImage]()
    var imgarray = [UIImage]()
    var starImageURLArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        wait4ExchCollectionView.backgroundColor = UIColor(red: 218.0/255.0, green: 218.0/255.0, blue: 218.0/255.0, alpha: 1.0)
        
        starImageURLArray = Constants.userWait4ExchImageURLArrayP
        
        if(starImageURLArray.count != 0){
            for i in 1 ... starImageURLArray.count{
                if let checkedUrl = URL(string: starImageURLArray[i-1]) {
                    
                    //downloadImage(url: checkedUrl)
                    getDataFromUrl(url: checkedUrl){(data, response, error) in }
                }
            }
        }
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Wait4ExchCollectionViewCell
        
        cell.ViewBorderFunction(HorW: false, clear: true, amount: 80, borderWidth: 1)
        cell.wait4ExchImageView.image = self.wait4ExchImageArray[indexPath.row]
        cell.wait4ExchObjNameLabel.text = Constants.userWait4ExchObjNameArray[indexPath.row]
        cell.wait4ExchCategoryNameLabel.text = Constants.userWait4ExchCategoryArray[indexPath.row]
        cell.wait4ExchOwnerNameLabel.text = Constants.facebookName
        
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
            self.wait4ExchImageArray = self.imgarray
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
}
