//
//  Category.swift
//  RecipeGuide
//
//  Created by Alex Paul on 8/12/21.
//

import Foundation

struct CategoryResponse: Codable {
    var categories: [Category]
    
    enum CodingKeys: String, CodingKey{
        case categories
    }
    
}

struct Category: Codable {
    let strCategory: String
    let strCategoryThumb: String
    
    enum CodingKeys: String, CodingKey{
        case strCategory
        case strCategoryThumb
    }

    
}
