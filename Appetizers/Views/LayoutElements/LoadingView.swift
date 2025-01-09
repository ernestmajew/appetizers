//
//  LoadingView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 23/12/2024.
//

import SwiftUI


struct LoadingView: View {
    @State private var isSpinning = false

    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.background)
            VStack(spacing: 20) {
                Image("ap_logo")
                    .resizable()
                    .foregroundStyle(.brandPrimary)
                    .frame(width: 32, height: 32)
                    .rotationEffect(Angle(degrees: isSpinning ? 360 : 0))
                    .animation(
                        Animation.linear(duration: 1.5)
                            .repeatForever(autoreverses: false),
                        value: isSpinning
                    )

                    .onAppear {
                        isSpinning = true
                    }
                Text("Loading...")
                    .opacity(0.5)
            }
 
        }
    }
}

#Preview {
    LoadingView()
}
