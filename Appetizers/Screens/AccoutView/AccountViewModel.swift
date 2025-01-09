//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Ernest Majewski on 20/12/2024.
//
import Foundation
import SwiftUI

final class AccoutViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    
    @Published var alertItem: AlertItem?
    @Published var user = User()
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty else {
            alertItem = AlertContext.emptyFirstName
            return false
        }
        guard !user.lastName.isEmpty else {
            alertItem = AlertContext.emptyLastName
            return false
        }
        guard !user.email.isEmpty else {
            alertItem = AlertContext.emptyEmail
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.saveSucccess
        } catch {
            alertItem = AlertContext.saveFail
        }
    }
    
    func retrieveUser() {
        guard let userData else {
            return
        }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.dataLoadError
        }
    }
    
    func signOut() {
        do {
            try AuthenticationManager.shared.signOut()
        } catch {
            alertItem = AlertContext.invalidResponse
        }
    }
}
