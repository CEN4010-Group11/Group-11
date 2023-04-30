//
//  WorkoutCell.swift
//  Healthfuel
//
//  Created by student on 4/29/23.
//

import UIKit

class WorkoutCell: UITableViewCell {
    
    @IBOutlet weak var workoutNameLabel: UILabel!
    
    @IBOutlet weak var targetedmuscleLabel: UILabel!
    
    @IBOutlet weak var benefitsLabel: UILabel!
    
    @IBOutlet weak var precautionsLabel: UILabel!
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    @IBOutlet weak var workoutusernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
