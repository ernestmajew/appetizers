//
//  RestaurantService.swift
//  Appetizers
//
//  Created by Ernest Majewski on 27/12/2024.
//

import FirebaseFirestore

final class RestaurantService {    
    func fetchRestaurants() async throws -> [Restaurant] {
        let snapshot = try await Firestore.firestore().collection("restaurants").getDocuments()
        
        let restaurants: [Restaurant] = try snapshot.documents.compactMap { doc in
            try doc.data(as: Restaurant.self)
            
        }
        return restaurants
    }
    
    func fetchDishes(for restaurant: Restaurant) async throws -> [Dish] {
        guard let restaurantId = restaurant.id else {
            return []
        }
        
        let snapshot = try await Firestore.firestore()
            .collection("restaurants")
            .document(restaurantId)
            .collection("dishes")
            .getDocuments()
        
        let dishes: [Dish] = try snapshot.documents.compactMap { doc in
            try doc.data(as: Dish.self)
        }
        return dishes
    }
}
