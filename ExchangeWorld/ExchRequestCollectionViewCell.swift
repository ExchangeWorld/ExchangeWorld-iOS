//
//  ExchRequestCollectionViewCell.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/12/14.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class ExchRequestCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate{
    @IBOutlet weak var userExchReqImageView: UIImageView!
    @IBOutlet weak var userExchReqQueuerCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ExchRequestQueuerCollectionViewCell
        return cell
    }
    
    
    
}
