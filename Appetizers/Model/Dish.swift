//
//  MenuItem.swift
//  Appetizers
//
//  Created by Ernest Majewski on 24/12/2024.
//

import Foundation
import FirebaseFirestore

struct Dish: Codable, Identifiable, Hashable {
    @DocumentID var id: String? = nil
    
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_ignored_"
        case name
        case description
        case price
        case imageURL = "imageUrl"
    }
}

let mockMenuItems: [Dish] = [
    Dish(
        id: "1",
        name: "Margherita Pizza",
        description: "Classic Italian pizza topped with fresh tomatoes, mozzarella, and basil.",
        price: 12.99,
        imageURL: "https://example.com/images/margherita_pizza.jpg"
    ),
    Dish(
        id: "2",
        name: "Spaghetti Carbonara",
        description: "Traditional pasta dish with pancetta, eggs, and Parmesan cheese.",
        price: 14.49,
        imageURL: "https://example.com/images/spaghetti_carbonara.jpg"
    ),
    Dish(
        id: "3",
        name: "Caesar Salad",
        description: "Crisp romaine lettuce, croutons, Parmesan cheese, and Caesar dressing.",
        price: 9.99,
        imageURL: "https://example.com/images/caesar_salad.jpg"
    ),
    Dish(
        id: "4",
        name: "Grilled Chicken Sandwich",
        description: "Juicy grilled chicken breast on a toasted bun with lettuce and tomato.",
        price: 11.99,
        imageURL: "https://example.com/images/grilled_chicken_sandwich.jpg"
    ),
    Dish(
        id: "5",
        name: "Cheeseburger",
        description: "Beef patty topped with melted cheddar, lettuce, tomato, and pickles.",
        price: 10.99,
        imageURL: "https://example.com/images/cheeseburger.jpg"
    ),
    Dish(
        id: "6",
        name: "Fish Tacos",
        description: "Crispy battered fish served in soft tortillas with slaw and lime crema.",
        price: 13.49,
        imageURL: "https://example.com/images/fish_tacos.jpg"
    ),
    Dish(
        id: "7",
        name: "Vegetable Stir-Fry",
        description: "Fresh veggies stir-fried in a savory soy-based sauce, served with rice.",
        price: 12.49,
        imageURL: "https://example.com/images/vegetable_stir_fry.jpg"
    ),
    Dish(
        id: "8",
        name: "BBQ Ribs",
        description: "Tender pork ribs coated in smoky barbecue sauce, served with fries.",
        price: 17.99,
        imageURL: "https://example.com/images/bbq_ribs.jpg"
    ),
    Dish(
        id: "9",
        name: "Pepperoni Pizza",
        description: "Classic pizza topped with mozzarella cheese and spicy pepperoni.",
        price: 13.99,
        imageURL: "https://example.com/images/pepperoni_pizza.jpg"
    ),
    Dish(
        id: "10",
        name: "Chocolate Lava Cake",
        description: "Decadent chocolate cake with a gooey molten center, served warm.",
        price: 6.99,
        imageURL: "https://example.com/images/chocolate_lava_cake.jpg"
    )
]
