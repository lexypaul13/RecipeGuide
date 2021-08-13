//
//  ErrorMessage.swift
//  RecipeGuide
//
//  Created by Alex Paul on 8/12/21.
//

import Foundation
enum ErrorMessage:String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case invaldURL = "Not a valid Url"
    case saveFailure = "There was an issue saving this car"
    case duplicateShow = "Duplicate detected"
}
