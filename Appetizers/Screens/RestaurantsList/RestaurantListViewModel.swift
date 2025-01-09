//
//  RestaurantListViewModel.swift
//  Appetizers
//
//  Created by Ernest Majewski on 24/12/2024.
//


import Observation
import FirebaseFirestore

@Observable class RestaurantListViewModel {
    var restaurants: [Restaurant] = []
    var isLoading = false
    var selectedRestaurant: Restaurant?
    
    private let service: RestaurantService
    
    init(service: RestaurantService = RestaurantService()) {
        self.service = service
    }
    
    func fetchRestaurants() {
        Task {
            do {
                isLoading = true
                let list = try await service.fetchRestaurants()
                restaurants = list
                isLoading = false
            } catch {
                isLoading = false
                print(error)
            }
        }
    }
}
