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
    

    func setupTableView(meal:Meal){
        mealName.text = meal.strMeal
        mealImage.downloadImage(from: meal.strMealThumb)
    }
    

}
