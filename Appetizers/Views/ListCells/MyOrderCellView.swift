//
//  MyOrderCellView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 09/01/2025.
//

import SwiftUI

struct MyOrderCellView: View {
    let item: OrderItem
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(item.dish.name) \(item.count > 1 ? "x \(item.count)" : "")")
                        .fontWeight(.semibold)
                    
                    Text("Extras:")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .opacity(0.8)
                    
                    Text("Extra napkins - \(item.extraNapkins ? "Yes" : "No")")
                        .font(.footnote)
                        .opacity(0.8)
                    Text("Plastic cutlery - \(item.extraNapkins ? "Yes" : "No")")
                        .font(.footnote)
                        .opacity(0.8)
                }
                
                Spacer()
                AsyncImage(url: URL(string: item.dish.imageURL)) { image in
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
            
            Divider()
            
            HStack() {
                Text("$\(item.dish.price, specifier: "%.2f") \(item.count > 1 ? "x \(item.count)" : "")")
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Text("$\(item.totalPrice, specifier: "%.2f")")
                    .foregroundStyle(.brandPrimary)
                    .fontWeight(.semibold)
            }

        }
    }
}

#Preview {
    List{
        MyOrderCellView(
            item: OrderItem(
                dish: mockMenuItems[0],
                count: 2,
                extraNapkins: true,
                plasticCutlery: true
            )
        )
    }.listStyle(.plain)
}
