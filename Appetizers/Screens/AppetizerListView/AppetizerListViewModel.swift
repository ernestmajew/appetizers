//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Ernest Majewski on 20/12/2024.
//

import Foundation
import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var selectedItem: Appetizer?
    
    var hasSelectedItem: Bool { selectedItem != nil }
    
    func setSelectedItem(appetizer: Appetizer) {
        selectedItem = appetizer
    }
    
    func closeSelectedItem() {
        selectedItem = nil
    }
    
    func getAppetizers() {
        self.isLoading = true

        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }
}
