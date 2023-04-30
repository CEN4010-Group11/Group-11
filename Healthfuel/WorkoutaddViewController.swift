//
//  WorkoutaddViewController.swift
//  Healthfuel
//
//  Created by student on 4/29/23.
//

import UIKit
import Parse

class WorkoutaddViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var workoutNameField: UITextField!
    
    @IBOutlet weak var targetedmuscleField: UITextField!
    
    @IBOutlet weak var benefitsField: UITextField!
    
    @IBOutlet weak var precautionsField: UITextField!
    
    @IBOutlet weak var instructionsField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func workoutuploadButton(_ sender: Any) {
        let workoutPost = PFObject(className: "workoutPosts")
        
        workoutPost["workoutName"] = workoutNameField.text!
        workoutPost["targetedmuscle"] = targetedmuscleField.text!
        workoutPost["benefits"] = benefitsField.text!
        workoutPost["precautions"] = precautionsField.text!
        workoutPost["instructions"] = instructionsField.text!
        workoutPost["author"] = PFUser.current()!
        
        workoutPost.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("workout post saved!")
            } else {
                print ("error saving workout post!")
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
