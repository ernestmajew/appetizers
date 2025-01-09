//
//  AppetizerListItem.swift
//  Appetizers
//
//  Created by Ernest Majewski on 20/12/2024.
//

import SwiftUI


struct AppetizerListCellView: View {
    var appetizer: Appetizer
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .modifier(ListImageStyle())
            } placeholder: {
                Image("backupImage")
                    .resizable()
                    .modifier(ListImageStyle())
            }
            VStack(alignment: .leading) {
                Text(appetizer.name)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }.padding()

        }
        .padding(.vertical, 2.0)
    }
}

#Preview {
    AppetizerListCellView(appetizer: MockData.sampleAppetizer)
}
