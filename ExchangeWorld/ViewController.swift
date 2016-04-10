//
//  ViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/4/10.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet var collectionView: UICollectionView!
    
    let appleProducts = ["Iphone" , "Apple Watch" , "Mac" , "iPad" , "iCar" , "iPlane" , "iCloth" , "iShoes" , "iWater" , "iFood" , "iFish" , "iPet"]
    
    let imageArray = [UIImage(named: "鬥牛犬１"), UIImage(named: "鬥牛犬２"), UIImage(named: "鬥牛犬３"), UIImage(named: "鬥牛犬４"), UIImage(named: "鬥牛犬５"), UIImage(named: "鬥牛犬６"), UIImage(named: "鬥牛犬７"), UIImage(named: "鬥牛犬８"), UIImage(named: "鬥牛犬９"), UIImage(named: "鬥牛犬１０"), UIImage(named: "鬥牛犬１１"), UIImage(named: "鬥牛犬１２"),  ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appleProducts.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)as! CollectionViewCell
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        
        cell.titleLabel?.text = self.appleProducts[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showImage", sender: self)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showImage"{
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destinationViewController as! NewViewController
            
            vc.image = self.imageArray[indexPath.row]!
            vc.title = self.appleProducts[indexPath.row]
        } 
    }
    
    
    
}
