//
//  SocialLoginButton.swift
//  Appetizers
//
//  Created by Ernest Majewski on 23/12/2024.
//

import SwiftUI

struct SocialLoginButtonView: View {
    var icon: String
    var title: String
    var isImageIcon: Bool = false
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                if isImageIcon {
                    Image(icon)
                        .resizable()
                        .frame(width: 24, height: 24)
                } else {
                    Image(systemName: icon)
                        .imageScale(.large)
                        .frame(width: 24, height: 24)
                }
                Text(title)
            }
            .frame(maxWidth: .infinity)
            .padding(14)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.primary, lineWidth: 1)
                    .opacity(0.5)
            )
        }
        .background(Color.clear)
        .foregroundStyle(.primary)

    }
}
#Preview {
    SocialLoginButtonView(icon: "apple.logo", title: "Continue with Apple") {
        print("Apple login")
    }
}
