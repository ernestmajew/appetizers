//
//  RootView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 24/12/2024.
//

import SwiftUI
import SwiftUI

struct RootView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var order = Order()
    
    var body: some View {
        ZStack {
            if authViewModel.currentUser == nil {
                NavigationStack {
                    SignInView()
                }
            } else {
                AppetizerTabView()
                    .environmentObject(order)
            }
        }
    }
}

#Preview {
    RootView()
}
