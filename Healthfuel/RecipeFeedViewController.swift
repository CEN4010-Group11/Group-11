//
//  RecipeFeedViewController.swift
//  Healthfuel
//
//  Created by student on 4/29/23.
//

import UIKit
import Parse
import AlamofireImage

class RecipeFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var recipetableView: UITableView!
    
    var recipePosts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipetableView.delegate = self
        recipetableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let recipequery = PFQuery(className: "recipePosts")
        recipequery.includeKey("author")
        recipequery.limit = 20
        
        recipequery.findObjectsInBackground { (recipePosts, Error) in
            if recipePosts != nil {
                self.recipePosts = recipePosts!
                self.recipetableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipePosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipeCell
        
        let recipePost = recipePosts[indexPath.row]
        
        let user = recipePost["author"] as! PFUser
        cell.recipeusernameLabel.text = user.username
        cell.recipeNameLabel.text = recipePost["recipeName"] as! String
        cell.IngredientsLabel.text = recipePost["Ingredients"] as! String
        cell.cookinginstructionsLabel.text = recipePost["cookinginstructions"] as! String
        
        let recipeimageFile = recipePost["recipeimage"] as! PFFileObject
        let recipeurlString = recipeimageFile.url!
        let recipeurl = URL(string: recipeurlString)!
        
        cell.recipephotoView.af.setImage(withURL: recipeurl)
        
        return cell
    }

    @IBAction func onLogoutButton(_ sender: Any) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let LoginViewController = main.instantiateViewController(identifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = LoginViewController
    }
    
}
