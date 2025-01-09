//
//  AppetizerListItemDetails.swift
//  Appetizers
//
//  Created by Ernest Majewski on 22/12/2024.
//

import SwiftUI

struct AppetizerDetailsView: View {
    let appetizer: Appetizer
    let onClose: () -> Void
    let onActionTap: () -> Void
    
    
    var body: some View {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: appetizer.imageURL))
                    .frame(width: 320, height: 240.0)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(alignment: .topTrailing) {
                        Button {
                            onClose()
                        } label: {
                            XButtonView()
                        }
                    }
                
                Text(appetizer.name)
                    .multilineTextAlignment(.center)
                    .font(.headline)
                
                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center)

                
                HStack(alignment: .center, spacing: 36) {
                    NutritionDetails(label: "Calories", value: "\(appetizer.calories)")
                    NutritionDetails(label: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionDetails(label: "Protein", value: "\(appetizer.protein) g")
                }
                Spacer()
                
                Button("Add to order - $\(appetizer.price, specifier: "%.2f")") {
                    onActionTap()
                }.modifier(StandardButtonStyle())

            }
            .padding()
            .background(.background)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .frame(width: 360, height: 560)
            .shadow(radius: 40)
    }
}

struct NutritionDetails: View {
    let label: String
    let value: LocalizedStringResource
    
    var body: some View {
        VStack(spacing: 12) {
            Text(label)
                .bold()
            Text(value)
                .italic()
        }
    }
}

#Preview {
    AppetizerDetailsView(appetizer: MockData.sampleAppetizer, onClose: {}, onActionTap: {})
}
