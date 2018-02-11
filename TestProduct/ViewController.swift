//
//  ViewController.swift
//  TestProduct
//
//  Created by sashaIOS on 08.02.18.
//  Copyright © 2018 sashaIOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: properties
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var defaultPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK: UITextDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        //hide keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealLabel.text = textField.text
    }
    
    
    //MARK: UIImagePickerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        defaultPhoto.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    //MARK:Actions
    @IBAction func setDefaultText(_ sender: UIButton) {
        self.mealLabel.text = "Default meal"
    }
    @IBAction func swithValue(_ sender: UISwitch) {
        if sender.isOn {
            self.mealLabel.text = ""
        }
        sender.setOn(false, animated: true)
    }
    
    @IBAction func onImageTap(_ sender: Any) {
        textField.resignFirstResponder()
        let uiImagePickerController = UIImagePickerController()
        uiImagePickerController.sourceType = .photoLibrary
        uiImagePickerController.delegate = self
        present(uiImagePickerController,animated: true,completion: nil)
        
    }
}

