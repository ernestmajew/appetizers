//
//  AccountView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 20/12/2024.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccoutViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("First name", text: $viewModel.user.firstName)
                            .focused($focusedTextField, equals: .firstName)
                            .onSubmit {
                                focusedTextField = .lastName
                            }
                            .submitLabel(.next)
                        
                        TextField("Last name", text: $viewModel.user.lastName)
                            .focused($focusedTextField, equals: .lastName)
                            .onSubmit {
                                focusedTextField = .email
                            }
                            .submitLabel(.next)
                        
                        TextField("Email", text: $viewModel.user.email)
                            .focused($focusedTextField, equals: .email)
                            .onSubmit {
                                focusedTextField = nil
                            }
                            .submitLabel(.continue)
                        
                        DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: [.date])
                    }
                    
                    Section(header: Text("Requests")) {
                        Toggle("Extra napkins", isOn: $viewModel.user.extraNapkins)
                        Toggle("Frequent refills", isOn: $viewModel.user.frequestRefills)
                    }.toggleStyle(SwitchToggleStyle(tint: Color(.brandPrimary)))

                    Button("Save changes") {
                        viewModel.saveChanges()
                    }
                    
                    Section {
                        Button("Sign out") {
                            viewModel.signOut()
                        }
                        .tint(.red)
                    }

                }


                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss") { focusedTextField = nil }
                    }
                }
            }
            .navigationTitle("Account")

        }
        .alert(item: $viewModel.alertItem) {alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        .onAppear() {
            viewModel.retrieveUser()
        }
    }
}

#Preview {
    AccountView()
}
