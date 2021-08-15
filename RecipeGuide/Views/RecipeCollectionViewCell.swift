//
//  RecipeCollectionViewCell.swift
//  RecipeGuide
//
//  Created by Alex Paul on 8/12/21.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    

    func setupCell(categories:Category){
        categoryName.text = categories.strCategory
        recipeImage.downloadImage(from: categories.strCategoryThumb)
        
    }
    
}
