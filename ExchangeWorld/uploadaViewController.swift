//
//  CameraViewController.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/11/23.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

struct cellData {
    let cell : Int!
    let text : String!
}

class uploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var photoLibraryButton: UIButton!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var userInputTitleLabel: UILabel!
    @IBOutlet weak var userInputTableView: UITableView!
    var pickedImage: UIImage!
    var arrayOfCellData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let picker = UIImagePickerController()
        let screenSize: CGRect = UIScreen.main.bounds
        
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
        self.view.backgroundColor = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        userInputTitleLabel.frame = CGRect(x: screenSize.width*0.02, y: screenSize.height*0.44, width: screenSize.width*0.3, height: screenSize.width*0.05)
        userInputTitleLabel.font = UIFont.systemFont(ofSize: 17)
        userInputTitleLabel.textColor = UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        userInputTableView.frame = CGRect(x: 10, y: screenSize.height*0.48, width: screenSize.width-20, height: 240)
        
        arrayOfCellData = [cellData(cell: 1, text: "商品名稱（必填）"),
                           cellData(cell: 2, text: "商品種類"),
                           cellData(cell: 3, text: "商品敘述")]
        
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
        
        if let base64String = UIImageJPEGRepresentation(pickedImage, 0.9)?.base64EncodedString() {
//            print("-----------------")
//            print(base64String)
//            print("-----------------")
            Constants.imageInBase64 = base64String
        }
        
//        let imageData: NSData = UIImagePNGRepresentation(self.pickedImage) as NSData!
//        let imageBase64: String = imageData.base64EncodedData(options: .lineLength64Characters)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        if segueIdentifier == "sendImage" {
            print("111111111")
            httpPost(URL: "\(Constants.API_SERVER_URL)/api/upload/image?token=\(Constants.exwdToken)", parameters: ["filename": "uploadImgTRY1" , "base64": Constants.imageInBase64, "filetype":"jpg"])
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayOfCellData[indexPath.row].cell == 1{
            
            let cell = Bundle.main.loadNibNamed("uploadNameTableViewCell", owner: self, options: nil)?.first as! uploadNameTableViewCell
            cell.uploadNameTitleLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
        }
        else if arrayOfCellData[indexPath.row].cell == 2{
            let cell = Bundle.main.loadNibNamed("uploadCategoryTableViewCell", owner: self, options: nil)?.first as! uploadCategoryTableViewCell
            cell.uploadCategoryTitleLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
        }
        else if arrayOfCellData[indexPath.row].cell == 3{
            let cell = Bundle.main.loadNibNamed("uploadNameTableViewCell", owner: self, options: nil)?.first as! uploadNameTableViewCell
            cell.uploadNameTitleLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
        }
        else{
            
            let cell = Bundle.main.loadNibNamed("uploadNameTableViewCell", owner: self, options: nil)?.first as! uploadNameTableViewCell
            cell.uploadNameTitleLabel.text = arrayOfCellData[indexPath.row].text
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayOfCellData[indexPath.row].cell == 1{
            
            return 80
        }
        else if arrayOfCellData[indexPath.row].cell == 2{
            return 80
        }
        else{
            return 80
            
        }
    }
    
    
    
    
    
    
}
