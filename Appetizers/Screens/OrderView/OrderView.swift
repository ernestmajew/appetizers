//
//  OrderView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 20/12/2024.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                if (order.items.isEmpty) {
                    EmptyOrder()
                } else {
                    VStack {
                        List {
                            ForEach(order.items) { orderItem in
                                MyOrderCellView(item: orderItem)
                            }.onDelete(perform: order.deleteItems)
                        }
                        .listStyle(.plain)
                        
                        Button("Place order - $\(order.totalPrice, specifier: "%.2f")") {
                            
                        }.modifier(StandardButtonStyle())
                        .padding(.bottom)
                    }
                }
            }.navigationTitle("Your order")
        }
    }
}


struct EmptyOrder: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Spacer()
            Image(systemName: "basket")
                .imageScale(.large)
                .opacity(0.4)
            Text("Your order is empty!")
                .font(.headline)
                .foregroundStyle(.brandPrimary)
            Text("Browse menu to find something delicious to eat.")
                .font(.body)
                .multilineTextAlignment(.center)
            Spacer()
        }.padding()
            .offset(y: -50)

    }
}

#Preview {
    var order = Order()
    OrderView().environmentObject(order)
}
