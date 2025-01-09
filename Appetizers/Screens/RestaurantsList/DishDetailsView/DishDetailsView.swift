//
//  MenuItemDetails.swift
//  Appetizers
//
//  Created by Ernest Majewski on 24/12/2024.
//

import SwiftUI

struct DishDetailsView: View {
    @StateObject var viewModel: DishDetailsViewModel
    let onClose: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            AsyncImage(url: URL(string: viewModel.dish.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .clipped()
                    .ignoresSafeArea(.container)
            } placeholder: {
                Image("backupImage")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .clipped()
                    .ignoresSafeArea(.container)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text(viewModel.dish.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("\(viewModel.dish.price, specifier: "$%.2f")")
                    .font(.body)
                    .foregroundStyle(.brandPrimary)
                
                Text(viewModel.dish.description)
                    .font(.body)
                    .opacity(0.8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Options")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Toggle(isOn: $viewModel.extraNapkins) {
                    Text("Extra napkins")
                }.toggleStyle(APCheckboxToggleStyle())
                
                Toggle(isOn: $viewModel.cutlery) {
                    Text("Plastic cutlery")
                }.toggleStyle(APCheckboxToggleStyle())
            }
            .padding(.horizontal)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 12) {
                APStepperView(value: $viewModel.itemCount)
                Button("Add to order - $\(viewModel.dish.price, specifier: "%.2f")") {
                    viewModel.addToOrder()
                    onClose()
                }.modifier(StandardButtonStyle())
            }
        }
        .overlay(alignment: .topTrailing) {
            Button {
                onClose()
            } label: {
                XButtonView()
            }
        }
    }
}

#Preview {
    let mockOrder = Order()
    Text("Background").sheet(isPresented: .constant(true)) {
        DishDetailsView(viewModel: DishDetailsViewModel(dish: mockMenuItems[0], order: Order()), onClose: {})
    }
}
