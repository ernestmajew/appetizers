//
//  RestaurantDetailsView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 24/12/2024.
//

import SwiftUI

struct RestaurantDetailsView: View {
    @StateObject private var viewModel: RestaurantDetailsViewModel
    @EnvironmentObject private var order: Order
    
    
    init(restaurant: Restaurant, service: RestaurantService = RestaurantService()) {
        _viewModel = StateObject(
            wrappedValue: RestaurantDetailsViewModel(
                restaurant: restaurant,
                service: service
            )
        )
    }
    
    var body: some View {
        List {
            Section {
                HeaderImageView(
                    text: viewModel.restaurant.name,
                    imageUrl: viewModel.restaurant.imageURL
                )
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                
                Text(viewModel.restaurant.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .opacity(0.8)
                    .listRowSeparator(.hidden)
            }
            
            Section(header: Text("Dishes")
                .font(.title)
                .fontWeight(.semibold)) {
                    ForEach(viewModel.menuItems) { menuItem in
                        DishListCellView(dish: menuItem)
                            .onTapGesture {
                                viewModel.selectedDish = menuItem
                            }
                    }
                }
        }
        .listStyle(.plain)
        .task {
            await viewModel.fetchMenuItems()
        }
        .sheet(item: $viewModel.selectedDish) { dish in
            let dishDetailsViewModel = DishDetailsViewModel(dish: dish, order: order)
            DishDetailsView(viewModel: dishDetailsViewModel) {
                viewModel.selectedDish = nil
            }
        }
    }
}

#Preview {
    NavigationStack {
        RestaurantDetailsView(
            restaurant: Restaurant(
                name: "Test Restaurant",
                description: "Example description...",
                imageURL: "https://picsum.photos/400",
                tags: ["fastfood", "kebab"],
                menuItems: mockMenuItems,
                rating: 4.5
            )
        )
    }
}
