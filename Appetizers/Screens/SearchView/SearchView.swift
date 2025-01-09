//
//  SearchView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 27/12/2024.
//

import SwiftUI
import WrappingHStack

struct SearchView: View {
    @State private var searchInput = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                WrappingHStack(1...15, id: \.self, alignment: .center) {
                    TagCellView("\($0) taga") {
                        
                    }.padding(.bottom, 10)
                }.padding()
                Spacer()
            }.searchable(text: $searchInput) {
                
            }.navigationTitle("Search")
        }
    }
}

#Preview {
    NavigationStack {
        SearchView()
    }
}
