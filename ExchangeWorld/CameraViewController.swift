//
//  CameraViewController.swift
//  ExchangeWorld
//
//  Created by 盧與明 on 2016/5/16.
//  Copyright © 2016年 Exwd. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var photoLibraryButton: UIButton!
    
    @IBOutlet weak var showImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)

    }
    
    
    @IBAction func cameraButtonClicked(sender: UIButton) {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .Camera
        presentViewController(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func photoLibraryButtonClicked(sender: UIButton) {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        presentViewController(picker, animated: true, completion: nil)
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        showImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
