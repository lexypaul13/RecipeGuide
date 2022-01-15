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
    var foodDetails: Meals? = nil
    
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var layoutIngredientsTable: NSLayoutConstraint!
    @IBOutlet weak var layoutMeasurementTable: NSLayoutConstraint!
    @IBOutlet weak var instructions: UITextView!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var measureMentTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMealDetails()
        self.view.backgroundColor = .white
    }
    
    
    func getMealDetails(){
        NetworkManager.shared.getFoodDetail(.showMealDetails,category: "",mealID: mealID) { [self] mealsResponse in
            guard let foodDetails  =  mealsResponse?.meals else{
                self.alert(message: ErrorMessage.unableToComplete.rawValue, title: "No internet Connection")
                return
            }
            DispatchQueue.main.async {
                self.foodDetails = foodDetails.first
                layoutIngredientsTable.constant = CGFloat((self.foodDetails?.arrIngrediennts.count ?? 0) * 40)
                layoutMeasurementTable.constant = CGFloat((self.foodDetails?.arrMeasurements.count ?? 0) * 40)
                setUpData()
                ingredientTableView.reloadData()
                measureMentTableView.reloadData()
                
            }
            
            // Do any additional setup after loading the view.
        }
        
        func setUpData(){
            foodImage.downloadImage(from: (foodDetails?.strMealThumb) ?? "")
            foodName.text = foodDetails?.strMeal ?? ""
            instructions.text = foodDetails?.strInstructions ?? ""
        }
        
    }
    
    
}

extension MealDetailsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == ingredientTableView{
            return foodDetails?.arrIngrediennts.count ?? 0
        }
        else{
            return foodDetails?.arrMeasurements.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell", for: indexPath) as! TitleTableViewCell
        if tableView == ingredientTableView{
            cell.foodLabel.text = foodDetails?.arrIngrediennts[indexPath.row]
        }
        
        else{
            cell.foodLabel.text = foodDetails?.arrMeasurements[indexPath.row]
            
        }
        return cell
    }
    
    
}
