//
//  DishListCellView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 27/12/2024.
//

import SwiftUI

struct DishListCellView: View {
    let dish: Dish
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dish.name)
                Text("$\(dish.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                    .foregroundStyle(.brandPrimary)
            }
            
            Spacer()
            AsyncImage(url: URL(string: dish.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 90.0)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 8)
                    )
            } placeholder: {
                Image("backupImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 90.0)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 8)
                    )
            }
        }
    }
}

#Preview {
    DishListCellView(dish: mockMenuItems[0])
}
