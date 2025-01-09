//
//  OrderItem.swift
//  Appetizers
//
//  Created by Ernest Majewski on 09/01/2025.
//

import Foundation

struct OrderItem: Hashable, Identifiable {
    var id: String?
    var dish: Dish
    var count: Int
    var extraNapkins: Bool
    var plasticCutlery: Bool
    
    var totalPrice: Double {
        dish.price * Double(count)
    }
    
    init(
        dish: Dish,
        count: Int,
        extraNapkins: Bool,
        plasticCutlery: Bool
    ) {
        self.id = dish.id
        self.dish = dish
        self.count = count
        self.extraNapkins = extraNapkins
        self.plasticCutlery = plasticCutlery
    }
}
