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
    var starImageURLArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userStarCollectionView.backgroundColor = UIColor(red: 218.0/255.0, green: 218.0/255.0, blue: 218.0/255.0, alpha: 1.0)
        
        starImageURLArray = Constants.userStarImageURLArrayP
        print(starImageURLArray)
        
        
        
        for i in 1 ... starImageURLArray.count{
            if let checkedUrl = URL(string: starImageURLArray[i-1]) {
                
                //downloadImage(url: checkedUrl)
                getDataFromUrl(url: checkedUrl){(data, response, error) in }
            }
        }

        
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
        
        
        cell.userStarImageView.image = self.starImageArray[indexPath.row]
        
//        if var Image1 : UIImage = cell.viewWithTag(1) as? UIImage{
//        
//            Image1 = self.image1!
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: collectionView.bounds.size.width-30, height: collectionView.bounds.size.width*0.5-15)
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            //completion(data, response, error)
            self.starImageArray.append(UIImage(data: data!)!)
            semaphore.signal()
            }
        task.resume()
        semaphore.wait()
    }
    
//    func downloadImage(url: URL) {
//        print("Download Started")
//        getDataFromUrl(url: url) { (data, response, error)  in
//            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download Finished")
//            DispatchQueue.main.async() { () -> Void in
//                self.image1 = UIImage(data: data)
//                if (self.image1 != nil){
//                    print("wtfFFFFFFF")
//                    
//                }
//            }
//        }
//    }
    
    
    
}
    


