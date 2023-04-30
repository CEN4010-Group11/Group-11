import UIKit
import Parse
import AlamofireImage

class ProgressFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var progressPosts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    //creating the query that the progress posts will be saved to in the Parse database and identifying user/hidden keys.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "progressPosts")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (progressPosts, error) in
            if progressPosts != nil {
                self.progressPosts = progressPosts!
                self.tableView.reloadData()
            }
        }
        
    }
    
    //making it so the table automatically adds rows as more users add posts.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return progressPosts.count
    }
    
    //for more efficieny, we had the table reuse cells so instead of infinitely creating more and more cells, it'll just reuse any previously created cells that are not currently displayed on the screen; this will help prevent latency and overwhelming the backend server.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressCell") as! ProgressCell
        
        let progressPost = progressPosts[indexPath.row]
        
        let user = progressPost["author"] as! PFUser
        cell.usernameLabel.text = user.username
        cell.captionLabel.text = progressPost["caption"] as! String
        
        let imageFile = progressPost["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.progressphotoView.af.setImage(withURL: url)
        
        return cell
    }

    @IBAction func onLogoutButton(_ sender: Any) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let LoginViewController = main.instantiateViewController(identifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = LoginViewController
    }
    

}
