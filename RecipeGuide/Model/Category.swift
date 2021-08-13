//
//  Category.swift
//  RecipeGuide
//
//  Created by Alex Paul on 8/12/21.
//

import Foundation

// MARK: - Welcome
struct CategoryResponse: Codable {
    let categories: [Category]
   
    enum CodingKeys: String, CodingKey{
        case categories
    }
}

// MARK: - Category
struct Category: Codable {
    let strCategory: String
    let strCategoryThumb: String
    
    enum CodingKeys: String, CodingKey{
        case strCategory
        case strCategoryThumb
    }

    
}
