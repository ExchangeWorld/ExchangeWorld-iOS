//
//  CameraViewController.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/11/23.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class uploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var photoLibraryButton: UIButton!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var userInputTitleLabel: UILabel!
    @IBOutlet weak var userInputTableView: UITableView!
    var pickedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let picker = UIImagePickerController()
        let screenSize: CGRect = UIScreen.main.bounds
        
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
        self.view.backgroundColor = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        userInputTitleLabel.frame = CGRect(x: screenSize.width*0.05, y: screenSize.height*0.44, width: screenSize.width*0.3, height: screenSize.width*0.05)
        userInputTitleLabel.font = UIFont.systemFont(ofSize: 17)
        userInputTitleLabel.textColor = UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        
    }
    
    @IBAction func cameraAction(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .camera
        
        present(picker, animated: true, completion: nil)
        
    }

    @IBAction func photoLibraryAction(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageDisplay.image = info[UIImagePickerControllerOriginalImage] as? UIImage; dismiss(animated: true, completion: nil)
        self.pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        if segueIdentifier == "sendImage" {
//            guard let detailViewController = segue.destination as? HomeObjectCollectionViewController else {
//                return
//            }
//            guard let cell = sender as? UICollectionViewCell else {
//                return
//            }
//            let indexPath = self.collectionView?.indexPath(for: cell)
//            
//            detailViewController.categoryName = self.categoryImageArray[indexPath!.row]
//        }
        }
    
    }
    
}
