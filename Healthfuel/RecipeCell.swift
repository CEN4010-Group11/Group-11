//
//  RecipeCell.swift
//  Healthfuel
//
//  Created by student on 4/29/23.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    
    @IBOutlet weak var recipephotoView: UIImageView!
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    @IBOutlet weak var IngredientsLabel: UILabel!
    
    @IBOutlet weak var cookinginstructionsLabel: UILabel!
    
    @IBOutlet weak var recipeusernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
