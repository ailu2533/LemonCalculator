//
//  MultiLayerShadowButtonStyle2.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import SwiftUI

struct MultiLayerShadowButtonStyle2: ButtonStyle {
    let gridCellWidth: CGFloat
    let buttonBackgroundColor: Color
    var buttonForegroundColor: Color
    var buttonShadowColor: Color
    var buttonShadowRadius: CGFloat
    var buttonTextSize: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: buttonTextSize))
            .fontWeight(.bold)
            .frame(width: gridCellWidth, height: gridCellWidth)
            .background(
                ZStack {
                    // Outer shadow
                    Circle()
                        .fill(LinearGradient(colors: [Color(.startWhite), Color(.stopWhite)], startPoint: .topLeading, endPoint: .bottomTrailing))

                        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0.1, y: 0.1) // Bottom-right shadow
                        .shadow(color: Color.white.opacity(0.7), radius: 0, x: 0, y: -0.5) // Top-left highlight

                    // Inner button
                    Circle()
                        .fill(Color(buttonBackgroundColor))
                        .shadow(radius: 1)
                        .padding(1)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
            .foregroundColor(Color.white) // Text color
    }
}

struct MultiLayerShadowButtonStyle3: ButtonStyle {
    let gridCellHeight: CGFloat
    let gridCellWidth: CGFloat
    let buttonBackgroundColor: Color
    var buttonForegroundColor: Color = .white
    var buttonShadowColor: Color = .white
    var buttonShadowRadius: CGFloat = 2
    var buttonTextSize: CGFloat = 18

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: buttonTextSize))
            .fontWeight(.bold)
            .frame(width: gridCellWidth, height: gridCellHeight)
            .background(
                ZStack {
                    // Outer shadow
                    Capsule()
                        .fill(LinearGradient(colors: [Color(.startWhite), Color(.stopWhite)], startPoint: .topLeading, endPoint: .bottomTrailing))

                        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0.1, y: 0.1) // Bottom-right shadow
                        .shadow(color: Color.white.opacity(0.7), radius: 0, x: 0, y: -0.5) // Top-left highlight

                    // Inner button
                    Capsule()
                        .fill(Color(buttonBackgroundColor))
                        .shadow(radius: 1)
                        .padding(1)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
            .foregroundColor(Color.white) // Text color
    }
}
