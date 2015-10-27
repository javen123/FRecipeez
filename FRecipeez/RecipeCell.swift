//
//  RecipeCell.swift
//  FRecipeez
//
//  Created by Jim Aven on 10/27/15.
//  Copyright © 2015 Jim Aven. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var recipeTitleLbl: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(recipe:Recipe) {
        self.recipeTitleLbl.text = recipe.title
        self.recipeImg.image = recipe.getRecipeImg()
        self.clipsToBounds = true
        
    }
}
