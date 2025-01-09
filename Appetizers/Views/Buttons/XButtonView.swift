//
//  XButton.swift
//  Appetizers
//
//  Created by Ernest Majewski on 23/12/2024.
//

import SwiftUI

struct XButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.medium)
                .frame(width: 44, height: 44)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    XButtonView()
}
