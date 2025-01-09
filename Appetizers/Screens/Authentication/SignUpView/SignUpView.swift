//
//  RegisterView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 23/12/2024.
//

import SwiftUI

struct SignUpView: View {
    @State var viewModel = SignUpViewModel()

    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 12) {
                InputFieldView(text: $viewModel.email, icon: "envelope.fill", placeholder: "Email")
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()

                InputFieldView(text: $viewModel.password, icon: "key.fill", placeholder: "Password", isSecure: true)
                    .textContentType(.newPassword)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()

                InputFieldView(text: $viewModel.repeatPassword, icon: "repeat", placeholder: "Repeat password", isSecure: true)
                    .textContentType(.newPassword)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()


                Button {
                    viewModel.signUp()
                } label: {
                    Text("Sign up")
                        .frame(maxWidth: .infinity, minHeight: 32)
                }
                .buttonStyle(.borderedProminent)
                .tint(.brandPrimary)
                .foregroundStyle(.black)
                .padding(.top)
            }
        }
        .padding()
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        .navigationTitle("Sign Up")
    }
}


#Preview {
    NavigationStack {
        SignUpView()
    }
}
