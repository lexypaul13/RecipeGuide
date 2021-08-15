//
//  AlertVC.swift
//  RecipeGuide
//
//  Created by Alex Paul on 8/14/21.
//

import UIKit

enum ErrorMessage: String, Error{
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
}

extension UIViewController{
    func alert(message: String, title: String = "") {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
}
