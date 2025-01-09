//
//  DividerWithText.swift
//  Appetizers
//
//  Created by Ernest Majewski on 23/12/2024.
//

import SwiftUI

struct DividerWithText: View {
    var text: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray.opacity(0.3))
            
            Text(text)
                .padding(.horizontal)
                .background(Color(.systemBackground))
                .opacity(0.5)
        }
    }
}

#Preview {
    DividerWithText(text: "Test")
}
