//
//  StandardTextField.swift
//  Appetizers
//
//  Created by Ernest Majewski on 23/12/2024.
//

import SwiftUI

struct RoundedFrameStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: .infinity)
            .background(Color(.secondarySystemBackground))
            .clipShape(
                RoundedRectangle(cornerRadius: 10)
            )

    }
}
