//
//  APStepperView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 27/12/2024.
//

import SwiftUI
import Foundation

struct APStepperView: View {
    @Binding var value: Int
    
    var body: some View {
        HStack(spacing: 6) {
            Button {
                value -= 1
            } label: {
                Image(systemName: "minus.circle")
            }
            
            Text("\(value)")
                .frame(width: 35)
            
            Button {
                value += 1
            } label: {
                Image(systemName: "plus.circle")
            }
        }
        .padding(.horizontal, 12)
        .frame(height: 50)
        .background(.brandPrimary.opacity(0.25))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
