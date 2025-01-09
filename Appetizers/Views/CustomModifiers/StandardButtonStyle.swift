//
//  StandardButtonStyle.swift
//  Appetizers
//
//  Created by Ernest Majewski on 23/12/2024.
//

import Foundation
import SwiftUICore
import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
