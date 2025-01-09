//
//  RestaurantCard.swift
//  Appetizers
//
//  Created by Ernest Majewski on 24/12/2024.
//

import SwiftUI

struct RestaurantCardView: View {
    var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: restaurant.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 160)
                    .clipped()
            } placeholder: {
                Image("backupImage")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 160)
                    .clipped()
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("\(restaurant.name)")
                        .fontWeight(.semibold)
                    Text("\(restaurant.description)")
                        .fontWeight(.light)
                        .font(.caption)
                        .opacity(0.8)
                }
                Spacer()
                HStack {
                    Text("\(restaurant.rating, specifier: "%.1f")")
                    Image(systemName: "face.smiling.inverse")
                }                    .padding(.vertical, 4.0)
                    .padding(.horizontal, 6.0)
                    .background(Color(.systemGray2))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 10)
                    )


            }
            .padding()
        }
        .background(.thickMaterial)
        .clipShape(
            RoundedRectangle(cornerRadius: 12)
        )
        .overlay(alignment: .topTrailing) {
            Button {
            } label: {
                SaveButtonView()
            }
        }
    }
}

#Preview {
    RestaurantCardView(restaurant:
                    Restaurant(name: "Test restaurant",
                               description: "This is test restaurant",
                               imageURL: "",
                               tags: [],
                               menuItems: [],
                               rating: 5.0)
    )
}
