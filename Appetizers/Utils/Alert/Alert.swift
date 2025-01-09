//
//  Alert.swift
//  Appetizers
//
//  Created by Ernest Majewski on 20/12/2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidResponse      = AlertItem(title: Text("Server Error"),
                                                message: Text("Invalid response from the server. Please contact support."),
                                                dismissButton: .default(Text("Ok")))
    
    static let invalidData          = AlertItem(title: Text("Server Error"),
                                                message: Text("Data recieved form the server was invalid. Please contact support."),
                                                dismissButton: .default(Text("Ok")))
    
    static let invalidUrl           = AlertItem(title: Text("Server Error"),
                                                message: Text("There was an issue connecting to the server. Please contact support."),
                                                dismissButton: .default(Text("Ok")))
    
    static let unableToComplete     = AlertItem(title: Text("Server Error"),
                                                message: Text("Unable to comlete your request. Please contact support."),
                                                dismissButton: .default(Text("Ok")))
    
    static let emptyLastName        = AlertItem(title: Text("Invalid input"),
                                                message: Text("Last name cannot be empty."),
                                                dismissButton: .default(Text("Ok")))
    
    static let emptyFirstName       = AlertItem(title: Text("Invalid input"),
                                                message: Text("First name cannot be empty."),
                                                dismissButton: .default(Text("Ok")))
        
    static let emptyEmail           = AlertItem(title: Text("Invalid input"),
                                                message: Text("Email cannot be empty."),
                                                dismissButton: .default(Text("Ok")))
    
    static let invalidEmail         = AlertItem(title: Text("Invalid input"),
                                                message: Text("Provided email is invalid."),
                                                dismissButton: .default(Text("Ok")))
    
    static let saveSucccess         = AlertItem(title: Text("Success"),
                                                message: Text("Data has been saved."),
                                                dismissButton: .default(Text("Ok")))
    
    static let saveFail             = AlertItem(title: Text("Error"),
                                                message: Text("Failed saving data."),
                                                dismissButton: .default(Text("Ok")))
    
    static let dataLoadError        = AlertItem(title: Text("Error"),
                                                message: Text("Failed loading profile data."),
                                                dismissButton: .default(Text("Ok")))
    
    static let invalidCredentials   = AlertItem(title: Text("Error"),
                                                message: Text("Invalid credentials."),
                                                dismissButton: .default(Text("Ok")))
    
    static let invalidPassword      = AlertItem(title: Text("Error"),
                                                message: Text("Invalid password format."),
                                                dismissButton: .default(Text("Ok")))
    
    static let passwordsNotTheSame  = AlertItem(title: Text("Error"),
                                                message: Text("Passwords are not the same."),
                                                dismissButton: .default(Text("Ok")))
    
    static let signUpError          = AlertItem(title: Text("Error"),
                                                message: Text("Sign up failed."),
                                                dismissButton: .default(Text("Ok")))

}
