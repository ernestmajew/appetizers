//
//  RestaurantDetailsViewModel.swift
//  Appetizers
//
//  Created by Ernest Majewski on 27/12/2024.
//

import SwiftUI

@MainActor
class RestaurantDetailsViewModel: ObservableObject {
    @Published var menuItems: [Dish] = []
    @Published var selectedDish: Dish?
    
    let restaurant: Restaurant
    private let service: RestaurantService
    
    init(restaurant: Restaurant, service: RestaurantService = RestaurantService()) {
        self.restaurant = restaurant
        self.service = service
    }
    
    func fetchMenuItems() async {
        do {
            menuItems = try await service.fetchDishes(for: restaurant)
        } catch {
            print("Failed to fetch menu items:", error)
        }
    }
}
