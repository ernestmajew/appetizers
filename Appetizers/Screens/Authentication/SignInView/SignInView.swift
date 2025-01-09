//
//  LoginView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 23/12/2024.
//

import SwiftUI

struct SignInView: View {
    @State var viewModel = SignInViewModel()

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Image("AP_Logo_type")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.accent)
            Spacer()
            VStack(spacing: 12) {
                InputFieldView(text: $viewModel.email, icon: "envelope.fill", placeholder: "Email")
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                InputFieldView(text: $viewModel.password, icon: "key.fill", placeholder: "Password", isSecure: true)
                    .textContentType(.password)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()

                Button {
                    viewModel.signIn()
                } label: {
                    Text("Login")
                        .frame(maxWidth: .infinity, minHeight: 32)
                }
                .buttonStyle(.borderedProminent)
                .tint(.brandPrimary)
                .foregroundStyle(.black)
                .padding(.top)
            }
            
            DividerWithText(text: "or")

            VStack(spacing: 12) {
                SocialLoginButtonView(icon: "apple.logo", title: "Continue with Apple") {
                    print("Apple login")
                }
                
                SocialLoginButtonView(icon: "googleLogo", title: "Continue with Google", isImageIcon: true) {
                    print("Google login")
                }
            }
            
            Spacer()
            
            NavigationLink {
                SignUpView()
            }
            label: {
                HStack {
                    Text("Don't have an account?")
                        .foregroundStyle(.secondary)
                    Text("Sign up")
                        .bold()
                        .foregroundStyle(.brandPrimary)
                }
            }
        }
        .padding()
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    NavigationStack {
        SignInView()
    }
}
