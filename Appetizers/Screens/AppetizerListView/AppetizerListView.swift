//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 20/12/2024.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    @EnvironmentObject var order: Order
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    if viewModel.appetizers.isEmpty {
                        Text("No appetizers available.")
                            .font(.headline)
                            .foregroundColor(.gray)
                    } else {
                        List(viewModel.appetizers) { appetizer in
                            AppetizerListCellView(appetizer: appetizer)
                                .onTapGesture {
                                    viewModel.setSelectedItem(appetizer: appetizer)
                                }
                        }
                        .listStyle(.inset)
                        .listRowSeparator(.hidden)
                        .disabled(viewModel.hasSelectedItem)
                    }
                    

                }
                .navigationTitle("Appetizers")
                .task {
                    viewModel.getAppetizers()
                }

                .alert(item: $viewModel.alertItem) { alertItem in
                    Alert(title: alertItem.title,
                          message: alertItem.message,
                          dismissButton: alertItem.dismissButton)
                }
            }
            .blur(radius: viewModel.hasSelectedItem ? 20 : 0)
            
            if viewModel.hasSelectedItem {
                AppetizerDetailsView(appetizer: viewModel.selectedItem ?? MockData.orderItemOne) {
                    viewModel.closeSelectedItem()
                } onActionTap: {
//                    order.add(viewModel.selectedItem!)
                    viewModel.closeSelectedItem()
                }
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

#Preview {
    AppetizerListView()
}
