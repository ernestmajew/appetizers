//
//  DishDetailsViewModel.swift
//  Appetizers
//
//  Created by Ernest Majewski on 27/12/2024.
//

import SwiftUI

class DishDetailsViewModel: ObservableObject {
    @Published var itemCount: Int = 1
    @Published var cutlery: Bool = true
    @Published var extraNapkins: Bool = false
    
    let dish: Dish
    let order: Order
    
    init(dish: Dish, order: Order) {
        self.dish = dish
        self.order = order
    }
    
    func addToOrder() {
        let orderItem = OrderItem(
            dish: dish,
            count: itemCount,
            extraNapkins: extraNapkins,
            plasticCutlery: cutlery
        )
        order.add(orderItem)
    }
}
