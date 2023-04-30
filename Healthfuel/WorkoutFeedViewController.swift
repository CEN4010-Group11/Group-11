//
//  WorkoutFeedViewController.swift
//  Healthfuel
//
//  Created by student on 4/29/23.
//

import UIKit
import Parse

class WorkoutFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var workouttableView: UITableView!
    
    var workoutPosts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        workouttableView.delegate = self
        workouttableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let workoutquery = PFQuery(className: "workoutPosts")
        workoutquery.includeKey("author")
        workoutquery.limit = 20
        
        workoutquery.findObjectsInBackground { (workoutPosts, Error) in
            if workoutPosts != nil {
                self.workoutPosts = workoutPosts!
                self.workouttableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell") as! WorkoutCell
        
        let workoutPost = workoutPosts[indexPath.row]
        
        let user = workoutPost["author"] as! PFUser
        cell.workoutusernameLabel.text = user.username
        cell.workoutNameLabel.text = workoutPost["workoutName"] as! String
        cell.targetedmuscleLabel.text = workoutPost["targetedmuscle"] as! String
        cell.benefitsLabel.text = workoutPost["benefits"] as! String
        cell.precautionsLabel.text = workoutPost["precautions"] as! String
        cell.instructionsLabel.text = workoutPost["instructions"] as! String
        
        return cell
    }

    @IBAction func onLogoutButton(_ sender: Any) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let LoginViewController = main.instantiateViewController(identifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = LoginViewController
    }
    
}
