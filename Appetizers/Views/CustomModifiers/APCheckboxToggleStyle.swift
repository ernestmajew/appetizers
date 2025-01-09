//
//  APCheckboxToggleStyle.swift
//  Appetizers
//
//  Created by Ernest Majewski on 27/12/2024.
//

import SwiftUI

struct APCheckboxToggleStyle: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button(action: {
                configuration.isOn.toggle()
                
            }, label: {
                HStack(alignment: .center) {
                    Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                        .imageScale(.large)
                        .foregroundStyle(.brandPrimary)
                    configuration.label
                    Spacer()
                }
            }).buttonStyle(.plain)

        }
}
