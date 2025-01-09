//
//  ContentView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 20/12/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    
    init() {
        UITabBarItem.appearance().badgeColor = .systemGray
    }
    
    var body: some View {
        TabView() {
            Tab ("Restaurants", systemImage: "fork.knife"){
                RestaurantListView(viewModel: RestaurantListViewModel())
            }
//            Tab ("Menu", systemImage: "fork.knife"){
//                AppetizerListView()
//            }
//            Tab ("Search", systemImage: "magnifyingglass"){
//                SearchView()
//            }
            Tab ("Order", systemImage: "cart"){
                OrderView()
            }.badge(order.items.count)
            
            Tab ("Account", systemImage: "person"){
                AccountView()
            }
        }.accentColor(.brandPrimaryColor)
    }
}

#Preview {
    var order = Order()
    AppetizerTabView().environmentObject(order)
}
