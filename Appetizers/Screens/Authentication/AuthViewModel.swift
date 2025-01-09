//
//  AuthViewModel.swift
//  Appetizers
//
//  Created by Ernest Majewski on 24/12/2024.
//

import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var currentUser: AuthDataResultModel?

    private var authStateHandle: AuthStateDidChangeListenerHandle?

    init() {
        setupAuthListener()
    }
    
    private func setupAuthListener() {
        authStateHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }
            if let user {
                self.currentUser = AuthDataResultModel(user: user)
            } else {
                self.currentUser = nil
            }
        }
    }
    
    deinit {
        if let handle = authStateHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    func signUp(email: String, password: String) async throws {
        let result = try await AuthenticationManager.shared.createUser(email: email, password: password)
        self.currentUser = result
    }
    
    func signIn(email: String, password: String) async throws {
        let result = try await AuthenticationManager.shared.authenticateUser(email: email, password: password)
        self.currentUser = result
    }
    
    func signOut() {
        do {
            try AuthenticationManager.shared.signOut()
            self.currentUser = nil
        } catch {
            print("Error signing out: \(error)")
        }
    }
}
