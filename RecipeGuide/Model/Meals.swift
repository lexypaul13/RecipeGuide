//
//  Meals.swift
//  RecipeGuide
//
//  Created by Alex Paul on 8/12/21.
//

import Foundation


// MARK: - MealsResponse
struct MealsResponse: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
