//
//  ViewController.swift
//  PuppyTracker
//
//  Created by Michael Neas on 2/19/18.
//  Copyright © 2018 Michael Neas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: Properties
    @IBOutlet weak var puppyNameTextField: UITextField!
    @IBOutlet weak var puppyNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Handle text fields user input from delegate callbacks
        puppyNameTextField.delegate = self
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        puppyNameLabel.text = textField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //if a user cancels it then dismiss
        dismiss(animated: true, completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //desire the original image
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided: \(info)")
        }
        //show selected image
        photoImageView.image = selectedImage
        //dismiss once finished
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //dont show keyboard for image selection
        puppyNameTextField.resignFirstResponder()
        //view vontroller for media from photo library
        let imagePickerController = UIImagePickerController()
        //pick photos, dont take them, enumeration of photolib
        imagePickerController.sourceType = .photoLibrary
        //view controller notified when user picks image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
}
