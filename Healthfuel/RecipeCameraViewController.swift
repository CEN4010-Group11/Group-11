//
//  RecipeCameraViewController.swift
//  Healthfuel
//
//  Created by student on 4/29/23.
//

import UIKit
import AlamofireImage
import Parse

class RecipeCameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var recipleimageView: UIImageView!
    
    @IBOutlet weak var recipeNameField: UITextField!
    
    @IBOutlet weak var IngredientsField: UITextField!
    @IBOutlet weak var cookinginstructionsField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func recipeuploadButton(_ sender: Any) {
        let recipePost = PFObject(className: "recipePosts")
        
        recipePost["recipeName"] = recipeNameField.text!
        recipePost["Ingredients"] = IngredientsField.text!
        recipePost["cookinginstructions"] = cookinginstructionsField.text!
        recipePost["author"] = PFUser.current()!
        
        let recipeimageData = recipleimageView.image!.pngData()
        let recipefile = PFFileObject(name: "recipeimage.png", data: recipeimageData!)
        
        recipePost["recipeimage"] = recipefile
        
        recipePost.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("recipe post saved!")
            } else {
                print("error saving recipe post!")
            }
        }
    }
    
    @IBAction func recipeCameraButton(_ sender: Any) {
        let recipepicker = UIImagePickerController()
        recipepicker.delegate = self
        recipepicker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            recipepicker.sourceType = .camera
        } else {
            recipepicker.sourceType = .photoLibrary
        }
        present(recipepicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let recipeimage = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledimage = recipeimage.af_imageScaled(to: size)
        
        recipleimageView.image = scaledimage
        
        dismiss(animated: true, completion: nil)
    }
    
    


}
