//
//  MealDetailsVC.swift
//  RecipeGuide
//
//  Created by Alex Paul on 8/13/21.
//

import UIKit

class MealDetailsVC: UIViewController {
    var meals:[Meals]?  = []
    var mealID = ""
    
    @IBOutlet weak var foodHeaderView: FoodDetailsHeaderView!
    let foodDetails: Meals? = nil
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
        getMealDetails()
        // setUpFoodHeaderView()
    }
    
//    func setUpFoodHeaderView(){
//        foodHeaderView.foodImage.downloadImage(from: foodDetails?.strMealThumb ?? "")
//        foodHeaderView.foodName.text = foodDetails?.strMeal
//
//    }

    func getMealDetails(){
        NetworkManager.shared.getFood(.showMealDetails, category: "", mealID: mealID) { (response: Meals!) in
            
            guard let foodDetails  =  response else{
                print("Something when wrong")
                return
            }
            print(foodDetails)
            // Do any additional setup after loading the view.
        }
    }
}

//
//extension MealDetailsVC: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return meals.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)
//    }
//
//
//
//
//}
