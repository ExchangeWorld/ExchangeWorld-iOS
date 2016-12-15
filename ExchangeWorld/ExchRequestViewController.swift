//
//  ExchRequestViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/14.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class ExchRequestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var userExchRequestCollectionView: UICollectionView!
    
    var image1 : UIImage? = nil
    var exchRequestOwnerImageArray = [UIImage]()
    var exchRequestQueuerImageArray = [[UIImage]]()
    var imgOwnerarray = [UIImage]()
    var imgQueuerarray = [[UIImage]]()
    var exchRequestOwnerImageURLArray : [String] = []
    var exchRequestQueuerImageURLArray : [[String]] = []
    var myObjCount = 0
    var queueCount = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userExchRequestCollectionView.backgroundColor = UIColor(red: 218.0/255.0, green: 218.0/255.0, blue: 218.0/255.0, alpha: 1.0)
    
        exchRequestOwnerImageURLArray = Constants.userExchRequestOwnerImageURLArrayP
        exchRequestQueuerImageURLArray = Constants.userExchRequestQueuerImageURLArrayP
        
        for i in 0 ... exchRequestOwnerImageURLArray.count-1{
            if let checkUrl1 = URL(string: exchRequestOwnerImageURLArray[i]){
                getDataFromUrl(url: checkUrl1, kind: 1){(data, response, error) in }
            }
        }
        for i in 0 ... exchRequestQueuerImageURLArray.count-1{
            for j in 0 ... exchRequestQueuerImageURLArray[i].count-1{
                if let checkUrl2 = URL(string: exchRequestQueuerImageURLArray[i][j]){
                    getDataFromUrl(url: checkUrl2, kind: 2){(data, response, error) in }
                }
            }
            self.myObjCount += 1
        }
        self.imgOwnerarray = []
        self.imgQueuerarray = []
        myObjCount = 0
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.userExchRequestOwnerImageURLArrayP.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ExchRequestCollectionViewCell
        
//        cell.ViewBorderFunction(HorW: false, clear: true, amount: 80, borderWidth: 1)
//        cell.wait4ExchImageView.image = self.wait4ExchImageArray[indexPath.row]
//        cell.wait4ExchObjNameLabel.text = Constants.userWait4ExchObjNameArray[indexPath.row]
//        cell.wait4ExchCategoryNameLabel.text = Constants.userWait4ExchCategoryArray[indexPath.row]
//        cell.wait4ExchOwnerNameLabel.text = Constants.facebookName
//        
//        self.imgOwnerarray = []
//        self.imgQueuerarray = []
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width-30, height: collectionView.bounds.size.width*0.5-15)
    }
    
    func getDataFromUrl(url: URL, kind: Int, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in

            if(kind == 1){
                self.imgOwnerarray.append(UIImage(data: data!)!)
                self.exchRequestOwnerImageArray = self.imgOwnerarray
            }
            else if(kind == 2){
                if (self.myObjCount != self.queueCount){
                    self.imgQueuerarray.append([UIImage(data: data!)!])
                    self.queueCount = self.myObjCount
                }
                else if(self.myObjCount == self.queueCount){
                    self.imgQueuerarray[self.queueCount].append(UIImage(data: data!)!)
                }
                self.exchRequestQueuerImageArray = self.imgQueuerarray
                print(self.exchRequestQueuerImageArray.count)
                print(self.imgQueuerarray.count)
            }
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }


}
