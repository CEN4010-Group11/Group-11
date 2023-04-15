//
//  ProgressCell.swift
//  Healthfuel
//
//  Created by student on 4/14/23.
//

import UIKit

class ProgressCell: UITableViewCell {

    
    @IBOutlet weak var progressphotoView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
