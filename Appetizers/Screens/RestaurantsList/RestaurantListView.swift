//
//  RestaurantListView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 24/12/2024.
//

import SwiftUI
import FirebaseFirestore

struct RestaurantListView: View {
    @State var viewModel: RestaurantListViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.restaurants) { restaurant in
                RestaurantCardView(restaurant: restaurant)
                    .onTapGesture {
                        viewModel.selectedRestaurant = restaurant
                    }
                    .listRowSeparator(.hidden)
                    .listRowSpacing(8)
            }
            .listStyle(.inset)
            .navigationDestination(item: $viewModel.selectedRestaurant) { restaurant in
                RestaurantDetailsView(restaurant: restaurant)
            }
            .onAppear {
                viewModel.fetchRestaurants()
            }
            .refreshable {
                viewModel.fetchRestaurants()
            }
            .navigationTitle("Restaurants")
        }
    }
}

#Preview {
    var viewModel = RestaurantListViewModel()
    NavigationStack {
        RestaurantListView(viewModel: viewModel)
    }
}
