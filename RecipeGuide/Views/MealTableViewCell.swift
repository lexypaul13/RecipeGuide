//
//  MealTableViewCell.swift
//  RecipeGuide
//
//  Created by Alex Paul on 8/12/21.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func setupTableView(meal:Meal){
        mealName.text = meal.strMeal
        mealImage.downloadImage(from: meal.strMealThumb)
    }
    

}
