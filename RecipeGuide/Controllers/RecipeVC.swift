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
       let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
       layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5 )
       layout.minimumLineSpacing = 40
       layout.itemSize = CGSize(width:(self.collectionView.frame.size.width-20)/2, height: self.collectionView.frame.size.height/3)
    }
    
    func getRecipes(){
        NetworkManager.shared.getFood(.categories, category: "", mealID: nil) { (response: CategoryResponse?) in
            guard let category =  response?.categories else{
                self.alert(message: ErrorMessage.unableToComplete.rawValue, title: "No internet Connection")
                return
            }
            DispatchQueue.main.async {
                self.category = category
                self.collectionView.reloadData()
            }
        }
        
    }
    
    
}




extension RecipeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! RecipeCollectionViewCell
        cell.setupCell(categories: category.sorted(by: { category_1, category_2 in
            category_1.strCategory < category_2.strCategory
        })[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.width / 2)
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "MealsVC") as? MealsVC
        vc?.meal = category[indexPath.row].strCategory
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
