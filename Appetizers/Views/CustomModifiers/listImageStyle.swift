//
//  listImageStyle.swift
//  Appetizers
//
//  Created by Ernest Majewski on 23/12/2024.
//

import Foundation
import SwiftUI

struct ListImageStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 120, height: 90)
            .clipped()
            .clipShape(
                RoundedRectangle(cornerRadius: 8)
            )
    }
}
