//
//  NetworkManager.swift
//  RecipeGuide
//
//  Created by Alex Paul on 8/12/21.
//

import UIKit

enum EndPoints {
    case categories
    case showMealCategory
    case showMealDetails
}

class NetworkManager{
    static let shared = NetworkManager()
    private let baseURL : String
    
    private init(){
        self.baseURL = "https://www.themealdb.com/api/json/v1/1/"
    }
    
    private var jsonDecoder : JSONDecoder = {
        let decoder =  JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    
    func getFood<T:Decodable>(_ endPoints: EndPoints, category:String?=nil, mealID:String?=nil, completed:@escaping(T?)->Void){
        guard let url =  urlBuilder(endPoint: endPoints, category: category!, mealID: mealID) else {
            print(ErrorMessage.invaldURL)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let _ = error {
                print(ErrorMessage.unableToComplete.rawValue)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode==200 else {
                print(error)
                return
            }
            
            guard let data = data else{
                print(ErrorMessage.invalidData.rawValue)
                return
            }
            do {
                let apiResponse = try self.jsonDecoder.decode(T.self, from: data)
                completed(apiResponse)
                
            } catch{
                print(error)
            }
        }
        task.resume()
    }
    
    
    
    
    func getFoodDetail(_ endPoints: EndPoints, category:String?=nil, mealID:String?=nil, completed:@escaping(MealsResponseDetail?)->Void){
        
        guard let url =  urlBuilder(endPoint: endPoints, category: category!, mealID: mealID) else {
            print(ErrorMessage.invaldURL)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let _ = error {
                print(ErrorMessage.unableToComplete.rawValue)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode==200 else {
                print(error)
                return
            }
            
            guard let data = data else{
                print(ErrorMessage.invalidData.rawValue)
                return
            }
            do {
                if endPoints == .showMealDetails{
                    
                    let apiResponse = try JSONDecoder().decode(MealsResponseDetail.self, from: data)
                    
                    completed(apiResponse)
                }
            } catch{
                print(error)
            }
        }
        task.resume()
    }
    
    
    
    
    
    
    
    private func urlBuilder(endPoint: EndPoints, category: String?, mealID: String? = nil) -> URL? {
        
        switch endPoint {
        case .categories:
            return URL(string: baseURL + "categories.php")
            
        case .showMealCategory:
            return URL(string: baseURL + "filter.php?c=\(category ?? "")")
            
        case .showMealDetails:
            return URL(string: baseURL + "lookup.php?i=\(mealID ?? "")")
        }
    }
    
}
