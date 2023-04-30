//
//  StatsCell.swift
//  Healthfuel
//
//  Created by student on 4/30/23.
//

import UIKit

class StatsCell: UITableViewCell {
    
    
    @IBOutlet weak var statusernameLabel: UILabel!
    
    @IBOutlet weak var currentweightLabel: UILabel!
    
    @IBOutlet weak var goalweightLabel: UILabel!
    
    @IBOutlet weak var currentcaloriesLabel: UILabel!
    
    @IBOutlet weak var goalcaloriesLabel: UILabel!
    
    @IBOutlet weak var currentdaysLabel: UILabel!
    
    @IBOutlet weak var goaldaysLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
