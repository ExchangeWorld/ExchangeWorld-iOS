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



    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userExchRequestCollectionView.backgroundColor = UIColor(red: 218.0/255.0, green: 218.0/255.0, blue: 218.0/255.0, alpha: 1.0)
  
        userExchRequestCollectionView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.userExchRequestOwnerImageURLArrayP.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let categoryNameChi = categoryEngToChi(categoryArray: Constants.userExchRequestOwnerCategoryArray)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ExchRequestCollectionViewCell
        
        cell.ViewBorderFunction(HorW: false, clear: true, amount: 80, borderWidth: 1)
        cell.userExchReqSeeQueuerButtonView.ViewBorderFunction(HorW: false, clear: false, amount: 60, borderWidth: 1)
        cell.userExchReqSeeQueuerButton.tag = indexPath.row
        cell.userExchReqImageView.sd_setImage(with: URL(string: Constants.userExchRequestOwnerImageURLArrayP[indexPath.row]), placeholderImage: UIImage(named: "loading"), options: [.continueInBackground, .progressiveDownload])
        
        cell.userExchReqObjLabel.text = Constants.userExchRequestOwnerObjNameArray[indexPath.row]
        cell.userExchReqCategoryLabel.text = categoryNameChi[indexPath.row]
        cell.userExchReqOwnerLabel.text = Constants.facebookName
        
        cell.userExchReqCategoryIcon.image = UIImage(named: Constants.userExchRequestOwnerCategoryArray[indexPath.row])
        
            
        

        return cell
    }
    
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width-30, height: collectionView.bounds.size.width*0.5-15+50)
    }
    
    
    

}
