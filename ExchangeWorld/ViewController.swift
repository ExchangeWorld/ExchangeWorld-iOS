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
    
    let posternameArray = ["郭俊文", "洪昕欣", "黃月韻", "蔡嘉貞", "駱宛君","李惠雯", "黃莉秋", "黃原法", "謝雅惠", "李靜合", "程俊宏", "童俊德"]
    
    let introducingArray = ["iPhone，是蘋果公司旗下研發的行動電話系列，它搭載蘋果公司研發的iOS（以前是iPhone OS）手機作業系统[13]。第一代iPhone於2007年1月9日由當時蘋果公司CEO的史蒂夫·賈伯斯發布[14]，並在同年6月29日正式發售[15][16]。2015年9月9日，蘋果公司在美國舊金山舉行新產品發布會上，推出第九代產品iPhone 6S，於同年9月25日正式發售。蘋果公司旗下智慧型手機iPhone系列，以個別推出的款式計算，可以是全球銷量第一大的智慧型手機。", "它讓你即時接收並回應你喜愛的通知，給你保持活力和健康所需的動力，並以全新方式展現你的個人風格。不論是運作方式還是外觀，Apple Watch 都不只是你穿戴的配件，它更是你不可或缺的自我表達。", "一直以來，iMac 背後的設計理念從未動搖，就是要打造無與倫比的桌上型電腦使用體驗。頂級顯示器，配上效能卓越的處理器、繪圖處理及儲存能力，全都盡收無比纖薄的無縫機身中。秉持同樣的信念，成就出全新 21.5 吋配備 Retina 4K 顯示器的 iMac 。它和革命性的 27 吋 5K 機型一樣，擁有細緻亮麗的畫質，足以讓周遭的一切頓時失色。這一切都讓 iMac 帶來最引人入勝的使用體驗，也再次向前邁出漂亮的一大步。", "iPad Pro 並非只是新一代 iPad，更是我們對當代個人電腦運算領域，堅信不疑的願景。它擁有超越多數筆記型電腦的強大威力，卻讓你以指尖運用自如；即使再複雜的工作，都可以輕觸、滑動或動筆書寫等自然的方式進行。不論你選擇 12.9 吋或全新的 9.7 吋機型，iPad Pro 比歷來出現過的都更有能力、更多才多藝、更方便攜帶。簡而言之，就是超強。", "1", "1", "1", "1", "1", "1", "1", "1"]
    
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
        
        cell.posterNameLabel?.text = self.posternameArray[indexPath.row]
        
        
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
            vc.objectname.text = self.appleProducts[indexPath.row]
            vc.postername.text = self.posternameArray[indexPath.row]
            vc.introduceLabel?.text = self.introducingArray[indexPath.row]
        } 
    }
    
    
    
}
