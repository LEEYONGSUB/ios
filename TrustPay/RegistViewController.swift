//
//  RegistViewController.swift
//  TrustPay
//
//  Created by zerolive on 2017. 1. 15..
//  Copyright © 2017년 Leonardo204. All rights reserved.
//

import UIKit
import MobileCoreServices

class RegistViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var txtFieldID: UITextField!
    @IBOutlet weak var txtFieldPassword1: UITextField!
    @IBOutlet weak var txtFieldPassword2: UITextField!
    @IBOutlet weak var txtFieldPhoneNumber: UITextField!

    @IBOutlet weak var RegImageView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    
    // flags for picture save
    var flagImageSave = false
    
    // variables for password confirm
    var password1:String?
    var password2:String?
    
    // samples for textFileds
    let idSample = "id@email.com"
    let passwordSample = "password"
    let phoneNumberSample = "010-1234-5678"
    
    // flags for user input
    var isInputId = false
    var isInputPhoneNumber = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Initial value setting
        RegImageView.image = UIImage(named: "iu_headphone.png")
        
        txtFieldID.text = idSample
        txtFieldPassword1.text = passwordSample
        txtFieldPassword2.text = passwordSample
        txtFieldPhoneNumber.text = phoneNumberSample
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func myAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(action);
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func chnageTextById(_ sender: Any) {
        if let value = txtFieldID.text {
            txtFieldID.text = value
            isInputId = true
            print("User id: ", txtFieldID.text! as String)
        }
    }
    @IBAction func changeTextByPassword1(_ sender: Any) {
        if let value = txtFieldPassword1.text {
            txtFieldPassword1.text = value
            password1 = value
        }
    }
    @IBAction func changeTextByPassword2(_ sender: Any) {
        if let value = txtFieldPassword2.text {
            txtFieldPassword2.text = value
            password2 = value
        }
        
        if ( password1 != "" && password2 != "" ) {
            if ( password1 == password2 ) {
                print("password1=",password1! as String)
                print("password2=",password2! as String)
                print("Password confirmation is successed!")
            } else {
                print("password1=",password1! as String)
                print("password2=",password2! as String)
                print("Password is not correct!")
            }
        }
    }
    @IBAction func changeTextByPhoneNumber(_ sender: Any) {
        if let value = txtFieldPhoneNumber.text {
            txtFieldPhoneNumber.text = value
            isInputPhoneNumber = true
            print("Phone Number: ", txtFieldPhoneNumber.text! as String)
        }
    }
    
    
    
    
    @IBAction func cleanTextFieldId(_ sender: Any) {
        if (isInputId == false) {
            txtFieldID.text = nil
        } else {
            print("Don't remove id field")
        }
    }
    @IBAction func cleanTextFieldPassword1(_ sender: Any) {
        txtFieldPassword1.text = nil
        password1 = nil
    }
    @IBAction func cleanTextFieldPassword2(_ sender: Any) {
        txtFieldPassword2.text = nil
        password2 = nil
    }
    @IBAction func cleanTextFieldPhoneNumber(_ sender: Any) {
        if (isInputPhoneNumber == false) {
            txtFieldPhoneNumber.text = nil
        } else {
            print("Don't remove phnoe number field")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        if let captureImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            RegImageView.image = captureImage
            self.dismiss(animated: true, completion: nil)
        } else if let captureImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            RegImageView.image = captureImage
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @nonobjc func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCaptureImageFromCamera(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert(title: "Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    @IBAction func btnCaptureImageFromLibrary(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
             
            self.present(imagePicker, animated: true, completion: nil)
            
        } else {
            myAlert(title: "Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }

    @IBAction func btnConfirm(_ sender: Any) {
        print("Pressed btnConfirm button")
        print("id: ", txtFieldID.text as Any)
        print("password1: ", txtFieldPassword1.text as Any)
        print("password2: ", txtFieldPassword2.text as Any)
        print("phone num: ", txtFieldPhoneNumber.text as Any)
    }
}
