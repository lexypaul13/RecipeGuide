//
//  MealsVC.swift
//  RecipeGuide
//
//  Created by Alex Paul on 8/12/21.
//

import UIKit

class MealsVC: UIViewController {
    var meal: String = ""
    var meals: [Meal] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMeals()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func getMeals(){
        NetworkManager.shared.getFood(.showMealCategory, category: meal, mealID: nil) { (response: MealsResponse?) in
            guard let food = response?.meals  else{
                print("Something when wrong")
                return
            }
            DispatchQueue.main.async {
                self.meals = food
                self.tableView.reloadData()
                
            }
        }
        
    }
    
    
}
extension MealsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as! MealTableViewCell
        cell.setupTableView(meal: meals[indexPath.row])
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mealDetails" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! MealDetailsVC
                destinationController.mealID = meals[indexPath.row].idMeal
                
            }
            
        }
        
    }
}
