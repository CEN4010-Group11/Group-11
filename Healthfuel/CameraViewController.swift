//
//  CameraViewController.swift
//  Healthfuel
//
//  Created by student on 4/14/23.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var captionField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //button that would save and upload the desired image
    @IBAction func onUploadButton(_ sender: Any) {
        let progressPost = PFObject(className: "progressPosts")
        
        progressPost["caption"] = captionField.text!
        progressPost["author"] = PFUser.current()!
        
        //identifying image source, type, and destination in the database.
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        progressPost["image"] = file
        
        //automatically saving the image without the user having to manually add it again
        progressPost.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else {
                print("error!")
            }
        }
    }
    
    //added a 'tap gesture recognizer' to the image view so the user would be able to tap anywhere on the image view and it'll display their photo album to choose what image they'd like to upload.
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
        picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
        
    }

}
