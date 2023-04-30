//
//  UpdateProfileViewController.swift
//  Healthfuel
//
//  Created by student on 4/30/23.
//

import UIKit
import Parse

class UpdateProfileViewController: UIViewController {
    
    @IBOutlet weak var currentweightField: UITextField!
    
    @IBOutlet weak var goalweightField: UITextField!
    
    @IBOutlet weak var averagecaloriesField: UITextField!
    
    @IBOutlet weak var goalcaloriesField: UITextField!
    
    @IBOutlet weak var currentdaysField: UITextField!
    
    @IBOutlet weak var goaldaysField: UITextField!
    
    @IBOutlet weak var dateField: UITextField!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func statsButton(_ sender: Any) {
        let statPost = PFObject(className: "statPosts")
        
        statPost["currentWeight"] = currentweightField.text!
        statPost["goalWeight"] = goalweightField.text!
        statPost["currentCalories"] = averagecaloriesField.text!
        statPost["goalCalories"] = goalcaloriesField.text!
        statPost["currentDays"] = currentdaysField.text!
        statPost["goalDays"] = goaldaysField.text!
        statPost["date"] = dateField.text!
        statPost["author"] = PFUser.current()!
        
        statPost.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("stat update saved!")
            } else {
                print ("error updating stats!")
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
