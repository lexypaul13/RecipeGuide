//
//  ViewController.swift
//  RecipeGuide
//
//  Created by Alex Paul on 8/12/21.
//

import UIKit

class RecipeVC: UIViewController {
    
    var category : [Category] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getRecipes()
        collectionView.delegate = self
        collectionView.dataSource =  self
        
        
        
    }
    
    func getRecipes(){
        NetworkManager.shared.getFood(.categories, category: "", mealID: nil) { (response: CategoryResponse?) in
            guard let category =  response?.categories else{
                print("Something when wrong")
                return
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    
}

extension RecipeVC: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! RecipeCollectionViewCell
        cell.setupCell(categories: category[indexPath.row])
        return cell
    }
}
