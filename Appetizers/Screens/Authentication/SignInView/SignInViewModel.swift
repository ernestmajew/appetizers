//
//  LoginViewModel.swift
//  Appetizers
//
//  Created by Ernest Majewski on 23/12/2024.
//

import Observation
import Foundation

@Observable class SignInViewModel {
    var alertItem: AlertItem?
    var email: String = ""
    var password: String = ""

    func signIn() {
        guard !email.isEmpty else {
            alertItem = AlertContext.invalidEmail
            return
        }
        guard isValidEmail(email) else {
            alertItem = AlertContext.invalidEmail
            return
        }
        guard !password.isEmpty else {
            alertItem = AlertContext.invalidPassword
            return
        }
        
        Task {
            do {
                try await AuthenticationManager.shared.authenticateUser(email: email, password: password)
            } catch {
                alertItem = AlertContext.unableToComplete
            }
        }

    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}
