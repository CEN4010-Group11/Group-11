//
//  StatsFeedViewController.swift
//  Healthfuel
//
//  Created by student on 4/30/23.
//

import UIKit
import Parse

class StatsFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var statstableView: UITableView!
    
    var statPosts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statstableView.delegate = self
        statstableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let statquery = PFQuery(className: "statPosts")
        statquery.includeKey("author")
        statquery.limit = 20
        
        statquery.findObjectsInBackground { (statPosts, Error) in
            if statPosts != nil {
                self.statPosts = statPosts!
                self.statstableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatsCell") as! StatsCell
        
        let statPost = statPosts[indexPath.row]
        
        let user = statPost["author"] as! PFUser
        cell.statusernameLabel.text = user.username
        cell.currentweightLabel.text = statPost["currentWeight"] as! String
        cell.goalweightLabel.text = statPost["goalWeight"] as! String
        cell.currentcaloriesLabel.text = statPost["currentCalories"] as! String
        cell.goalcaloriesLabel.text = statPost["goalCalories"] as! String
        cell.currentdaysLabel.text = statPost["currentDays"] as! String
        cell.goaldaysLabel
            .text = statPost["goalDays"] as! String
        cell.dateLabel.text = statPost["date"] as! String
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onLogoutButton(_ sender: Any) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let LoginViewController = main.instantiateViewController(identifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = LoginViewController
    }
    
    

}
