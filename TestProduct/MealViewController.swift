//
//  ViewController.swift
//  TestProduct
//
//  Created by sashaIOS on 08.02.18.
//  Copyright © 2018 sashaIOS. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: properties
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var defaultPhoto: UIImageView!
    @IBOutlet weak var save: UIBarButtonItem!
    @IBOutlet weak var rateView: RatingControl!
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        if let meal = meal {
            mealLabel.text = meal.name
            textField.text = meal.name
            defaultPhoto.image = meal.image
            rateView.rating = meal.rating
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === save else {
            return
        }
        let name = mealLabel.text ?? ""
        let image = defaultPhoto.image
        let rate = rateView.rating
        meal = Meal.init(name: name, image: image, rating: rate)
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
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isAddItemNavigation = presentedViewController is UINavigationController
        if isAddItemNavigation {
            dismiss(animated: true, completion: nil)
        } else if let ownNavController = navigationController {
            ownNavController.popViewController(animated: true)
        } else {
            fatalError("Unknown sourse")
        }
    }
    
    @IBAction func onImageTap(_ sender: Any) {
        textField.resignFirstResponder()
        let uiImagePickerController = UIImagePickerController()
        uiImagePickerController.sourceType = .photoLibrary
        uiImagePickerController.delegate = self
        present(uiImagePickerController,animated: true,completion: nil)
    }
}

