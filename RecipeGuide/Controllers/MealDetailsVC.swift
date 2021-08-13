//
//  MealDetailsVC.swift
//  RecipeGuide
//
//  Created by Alex Paul on 8/13/21.
//

import UIKit

class MealDetailsVC: UIViewController {
    var meals:[Meals] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.getFood(.showMealDetails, category: "", mealID: 52772) { (response: MealsResponse?) in
            
            guard let category =  response?.meals else{
                print("Something when wrong")
                return
            }
            print(category)
            // Do any additional setup after loading the view.
        }
    }
}
