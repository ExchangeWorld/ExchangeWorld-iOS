//
//  CameraViewController.swift
//  ExchangeWorld
//
//  Created by Apple on 2016/11/23.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit


class uploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var photoLibraryButton: UIButton!
    @IBOutlet weak var imageDisplay: UIImageView!
    
    
    @IBOutlet weak var userInputTitleLabel: UILabel!
    @IBOutlet weak var userInputView: UIView!
    @IBOutlet weak var uploadNameTitleLabel: UILabel!
    @IBOutlet weak var uploadNameTextField: UITextField!
    @IBOutlet weak var uploadCategoryTitleLabel: UILabel!
    @IBOutlet weak var uploadCategoryTextField: UITextField!
    @IBOutlet weak var uploadContextTitleLabel: UILabel!
    @IBOutlet weak var uploadContextTextView: UITextView!
    
    var pickedImage: UIImage!
    
    var categoryNum = 0
    let categories = ["書籍", "教科書", "電子產品", "3C配件", "服飾", "化妝品", "飾品", "食物", "家庭用品", "體育用品", "電玩遊戲", "其他"]
    let categoriesEng = ["Books", "Textbooks", "3C", "Clothes", "Cosmetic", "Accessories", "Food", "HouseWare", "Sports", "Games", "Others"]
    let picker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let screenSize: CGRect = UIScreen.main.bounds
        
        self.view.backgroundColor = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        

        imageDisplay.ViewBorderFunction(HorW: true, clear: false, amount: 50, borderWidth: 1.2)
        userInputView.ViewBorderFunction(HorW: false, clear: true, amount: 50, borderWidth: 1.2)
        
        userInputTitleLabel.font = UIFont.systemFont(ofSize: 17)
        userInputTitleLabel.textColor = UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        let heightConstraint = NSLayoutConstraint(item: userInputView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: screenSize.height*0.35)
        userInputView.addConstraint(heightConstraint)
        
        uploadNameTitleLabel.textColor = UIColor(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        uploadNameTitleLabel.text = "商品名稱"
        uploadNameTextField.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        uploadNameTextField.textColor = UIColor.black
        uploadNameTextField.ViewBorderFunction(HorW: false, clear: false, amount: 50, borderWidth: 0.1)
        uploadCategoryTitleLabel.text = "商品種類"
        uploadCategoryTitleLabel.textColor = uploadNameTitleLabel.textColor
        uploadCategoryTextField.backgroundColor = uploadNameTextField.backgroundColor
        uploadCategoryTextField.textColor = UIColor.black
        uploadCategoryTextField.ViewBorderFunction(HorW: false, clear: false, amount: 50, borderWidth: 0.1)
        uploadContextTitleLabel.text = "商品描述"
        uploadContextTitleLabel.textColor = uploadNameTitleLabel.textColor
        uploadContextTextView.backgroundColor = uploadNameTextField.backgroundColor
        uploadContextTextView.textColor = UIColor.black
        uploadContextTextView.ViewBorderFunction(HorW: false, clear: false, amount: 50, borderWidth: 0.2)
        

        picker.delegate = self
        picker.dataSource = self
        uploadCategoryTextField.inputView = picker
        
        uploadNameTextField.delegate = self
        uploadCategoryTextField.delegate = self
        
        
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        uploadNameTextField.resignFirstResponder()
        uploadCategoryTextField.resignFirstResponder()
        return true
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        uploadCategoryTextField.text = categories[row]
        categoryNum = row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    
    
    @IBAction func postingObjectButton(_ sender: Any) {
        
        //print(Constants.imageInBase64)
        
        let okAction = UIAlertAction(title: "確認", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
        }
        
        
        if(imageDisplay.image == nil){
            let alertController = UIAlertController(title: "系統提示", message: "尚未選擇相片", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        else if (uploadCategoryTextField.text == ""){
            let alertController = UIAlertController(title: "系統提示", message: "尚未選擇商品種類", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
            
        else{
            httpPost(URL: "\(Constants.API_SERVER_URL)/api/upload/image?token=\(Constants.exwdToken)", parameters: ["filesize":Constants.imageSize, "filename": "\(uploadNameTextField.text)" , "base64": "\(Constants.imageInBase64)", "filetype": Constants.imageType],returnJsonFormat: false)
        
            httpPost(URL: "\(Constants.API_SERVER_URL)/api/goods/post?token=\(Constants.exwdToken)", parameters: ["name":"\(uploadNameTextField.text!)", "category":"\(categoriesEng[categoryNum-1])", "description":"\(uploadContextTextView.text!)", "photo_path":"[\"\(Constants.imageURL)\"]", "position_x":121.5453914, "position_y":25.0261973],returnJsonFormat: true)


            let alertController = UIAlertController(title: "系統提示", message: "物品上傳成功", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        
        
        }
        
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
        let imageNSData = NSData(data: UIImageJPEGRepresentation(pickedImage, 0.9)!)
        
        if let base64String = UIImageJPEGRepresentation(pickedImage, 0.9)?.base64EncodedString() {
            Constants.imageInBase64 = base64String
            Constants.imageSize = imageNSData.length
            Constants.imageType = getImageType(imgData : imageNSData)
            print(Constants.imageSize)
            print(Constants.imageType)
//            print(Constants.imageInBase64)
        }
        
    }
    
        
    func getImageType(imgData : NSData) -> String
    {
        var c = [UInt8](repeatElement(0, count: 1))
        imgData.getBytes(&c, length: 1)
        
        let ext : String
        
        switch (c[0]) {
        case 0xFF:
            
            ext = "jpg"
            
        case 0x89:
            
            ext = "png"
        case 0x47:
            
            ext = "gif"
        case 0x49, 0x4D :
            ext = "tiff"
        default:
            ext = "" //unknown
        }
        return ext
    }
    
    
    
    
}
