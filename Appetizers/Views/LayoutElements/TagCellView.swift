//
//  TagCell.swift
//  Appetizers
//
//  Created by Ernest Majewski on 27/12/2024.
//

import SwiftUI

struct TagCellView: View {
    var label: LocalizedStringResource
    var action: () -> Void
    
    init(_ label: LocalizedStringResource, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }
    
    var body: some View {
        Text(label)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .foregroundStyle(.black)
            .background(.brandPrimary)
            .clipShape(RoundedRectangle(cornerRadius: .infinity))
            .onTapGesture {
                action()
            }
    }
}

#Preview {
    TagCellView("Test Tag") {
        print("On tap works")
    }
}
