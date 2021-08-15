//
//  Meals.swift
//  RecipeGuide
//
//  Created by Alex Paul on 8/12/21.
//

import Foundation


struct MealsResponse: Codable {
    var meals: [Meal]
}

struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct MealsResponseDetail: Codable {
    let meals: [Meals]
}
