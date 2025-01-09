//
//  SaveButtonView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 27/12/2024.
//

import SwiftUI

struct SaveButtonView: View {
    @State private var isSaved: Bool = false
    @State private var isPressed: Bool = false // For managing the animation
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 45, height: 45)
                .foregroundStyle(isSaved ? .brandPrimary : Color(.systemGray2))
                .shadow(radius: 10)
            Image(systemName: isSaved ? "heart.fill" : "heart")
                .imageScale(.large)
                .frame(width: 55, height: 55)
                .foregroundStyle(.primary)
        }
        .scaleEffect(isPressed ? 1.2 : 1.0)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.spring()) {
                    isPressed = false
                    isSaved.toggle()
                }
            }
        }
    }
}

#Preview {
    SaveButtonView()
}
