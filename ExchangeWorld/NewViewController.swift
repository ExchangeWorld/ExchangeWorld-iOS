//
//  NewViewController.swift
//  ExchangeWorld
//
//  Created by 王志尹 on 2016/4/10.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var objectNameLabel: UILabel!
    @IBOutlet var userIcon: UIImageView!
    @IBOutlet var posterNameLabel: UILabel!
    @IBOutlet var followIcon: UIImageView!
    @IBOutlet var followingLabel: UILabel!
    @IBOutlet var introduceLabel: UILabel!
    
    
    var image = UIImage()
    var objectname = UILabel()
    var postername = UILabel()
    var introducing = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = self.image
        self.objectNameLabel.text = self.objectname.text
        self.posterNameLabel.text = self.postername.text
        self.introduceLabel.text = self.introducing.text

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
