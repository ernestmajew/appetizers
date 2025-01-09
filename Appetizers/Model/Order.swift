//
//  Order.swift
//  Appetizers
//
//  Created by Ernest Majewski on 23/12/2024.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [OrderItem] = []
    
    var totalPrice: Double {
        items.map{ $0.dish }
        .reduce(0) { $0 + $1.price }
    }
    
    func add(_ orderItem: OrderItem) {
        items.append(orderItem)
    }
    
    func deleteItems(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}
