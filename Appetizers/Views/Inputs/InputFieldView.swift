//
//  InputField.swift
//  Appetizers
//
//  Created by Ernest Majewski on 23/12/2024.
//

import SwiftUI

struct InputFieldView: View {
    @Binding var text: String
    
    var icon: String
    var placeholder: String
    var isSecure: Bool = false

    var body: some View {
        HStack {
            Image(systemName: icon)
                .imageScale(.medium)
                .opacity(0.3)
                .frame(width: 24)
            
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .padding(14)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    InputFieldView(text: .constant(""), icon: "envelope.fill", placeholder: "Email")
}
