//
//  ImageHeaderView.swift
//  Appetizers
//
//  Created by Ernest Majewski on 27/12/2024.
//

import SwiftUI

struct HeaderImageView: View {
    let text: String
    let imageUrl: String
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .clipped()
            } placeholder: {
                Image("backupImage")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .clipped()
            }

            .overlay(alignment: .bottom) {
                VStack {
                    Text(text)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding(.top, 200)
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            stops: [
                                Gradient
                                    .Stop(
                                        color: Color(
                                            hue: 0.0,
                                            saturation: 1.0,
                                            brightness: 0.8,
                                            opacity: 0.0
                                        ),
                                        location: 0.0
                                    ),
                                Gradient
                                    .Stop(
                                        color: Color(
                                            hue: 0.0,
                                            saturation: 0.0,
                                            brightness: 0.0,
                                            opacity: 0.0
                                        ),
                                        location: 0.04038461538461539
                                    ),
                                Gradient
                                    .Stop(
                                        color: Color(.systemBackground),
                                        location: 1.0
                                    )
                            ]
                        ),
                        startPoint: UnitPoint.top,
                        endPoint: UnitPoint.bottom
                    )
                )
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    NavigationStack {
        HeaderImageView(text: "Test Restaurant", imageUrl: "https://picsum.photos/400")
    }
}
