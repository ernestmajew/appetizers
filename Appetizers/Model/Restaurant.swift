//
//  Restaurant.swift
//  Appetizers
//
//  Created by Ernest Majewski on 24/12/2024.
//

import Foundation
import FirebaseFirestore

struct Restaurant: Codable, Identifiable, Hashable {
    @DocumentID var id: String? = nil
    
    var name: String
    var description: String
    var imageURL: String
    var tags: [String]
    var menuItems: [Dish]
    var rating: Double
}
