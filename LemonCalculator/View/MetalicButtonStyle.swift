//
//  MetalicButtonStyle.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import SwiftUI

struct MetallicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.5), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
            )
            .foregroundColor(.black)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
    }
}

struct RadialMetalButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                RadialGradient(
                    gradient: Gradient(colors: [Color.gray.opacity(0.5), Color.gray]),
                    center: .center,
                    startRadius: 5,
                    endRadius: 100
                )
            )
            .foregroundColor(.black)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
    }
}

struct AngularMetalButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                GeometryReader { geometry in
                    AngularGradient(
                        gradient: Gradient(colors: [Color.gray.opacity(0.6), Color.gray.opacity(0.4), Color.gray.opacity(0.6)]),
                        center: .center,
                        angle: .degrees(0)
                    )
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
            )
            .foregroundColor(.black)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
    }
}

struct BlurredMetalButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                GeometryReader { geometry in
                    AngularGradient(
                        gradient: Gradient(colors: [Color.gray.opacity(0.6), Color.gray.opacity(0.4), Color.gray.opacity(0.6)]),
                        center: .center,
                        angle: .degrees(0)
                    )
                    .blur(radius: 5) // Applying Gaussian blur
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
            )
            .foregroundColor(.black)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
    }
}

struct NeumorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 100, height: 100)
            .padding(20)
            .background(
                ZStack {
                    Circle()
                        .fill(Color(red: 0.95, green: 0.9, blue: 0.7)) // Base color
                        .shadow(color: Color.white.opacity(0.8), radius: 10, x: -5, y: -5) // Top-left highlight
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5) // Bottom-right shadow

                    Circle()
                        .fill(Color(red: 0.95, green: 0.9, blue: 0.7))
                        .padding(5)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5) // Inner shadow
                        .shadow(color: Color.white.opacity(0.8), radius: 5, x: -5, y: -5) // Inner highlight
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
            .foregroundColor(Color(red: 0.6, green: 0.4, blue: 0.2)) // Text color
    }
}

struct NeumorphicButtonStyle2: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 100, height: 100)
            .padding(20)
            .background(
                ZStack {
                    Circle()
                        .fill(Color(red: 0.95, green: 0.9, blue: 0.7)) // Base color
                        .shadow(color: Color.white.opacity(0.8), radius: 8, x: -5, y: -5) // Top-left highlight
                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 5, y: 5) // Bottom-right shadow

                    Circle()
                        .fill(Color(red: 0.95, green: 0.9, blue: 0.7))
                        .padding(5)
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.6), lineWidth: 2)
                                .blur(radius: 2)
                                .offset(x: -2, y: -2)
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.black.opacity(0.2), lineWidth: 2)
                                .blur(radius: 2)
                                .offset(x: 2, y: 2)
                        )
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
            .foregroundColor(Color(red: 0.6, green: 0.4, blue: 0.2)) // Text color
    }
}

struct DarkNeumorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .padding(20)

            .background(
                ZStack {
                    // Outer ring
                    Circle()
                        .fill(Color.black.opacity(0.8))
                        .frame(width: 100, height: 100)
                        .shadow(color: Color.black.opacity(0.9), radius: 10, x: 5, y: 5) // Bottom-right shadow
                        .shadow(color: Color.white.opacity(0.1), radius: 10, x: -5, y: -5) // Top-left highlight

                    // Inner button
                    Circle()
                        .fill(Color.black)
                        .frame(width: 90, height: 90)
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.1), lineWidth: 2)
                                .blur(radius: 2)
                                .offset(x: -2, y: -2)
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.black.opacity(0.7), lineWidth: 2)
                                .blur(radius: 2)
                                .offset(x: 2, y: 2)
                        )
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
            .foregroundColor(Color.white) // Text color
    }
}

struct GrayNeumorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    // Outer ring
                    Circle()
                        .fill(Color(red: 0.9, green: 0.9, blue: 0.9))
                        .frame(width: 100, height: 100)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5) // Bottom-right shadow
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5) // Top-left highlight

                    // Inner button
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.8), Color.gray.opacity(0.6)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 90, height: 90)
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.6), lineWidth: 2)
                                .blur(radius: 2)
                                .offset(x: -2, y: -2)
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.black.opacity(0.2), lineWidth: 2)
                                .blur(radius: 2)
                                .offset(x: 2, y: 2)
                        )
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
            .foregroundColor(Color.black) // Text color
    }
}

struct SpottedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    // Outer ring
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 100, height: 100)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5) // Bottom-right shadow
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5) // Top-left highlight

                    // Inner button with texture
                    Circle()
                        .fill(
                            ImagePaint(image: Image("texture"), scale: 0.1)
                        )
                        .frame(width: 90, height: 90)
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.6), lineWidth: 2)
                                .blur(radius: 2)
                                .offset(x: -2, y: -2)
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.black.opacity(0.2), lineWidth: 2)
                                .blur(radius: 2)
                                .offset(x: 2, y: 2)
                        )
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
            .foregroundColor(Color.black) // Text color
    }
}

struct SkeuomorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    // Outer ring
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 100, height: 100)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5) // Bottom-right shadow
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5) // Top-left highlight

                    // Inner button with texture
                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.8), Color.gray.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                        )
                        .frame(width: 90, height: 90)
//                        .overlay(
//                            Circle()
//                                .stroke(Color.white.opacity(0.6), lineWidth: 2)
//                                .blur(radius: 2)
//                                .offset(x: -2, y: -2)
//                        )
//                        .overlay(
//                            Circle()
//                                .stroke(Color.black.opacity(0.2), lineWidth: 2)
//                                .blur(radius: 2)
//                                .offset(x: 2, y: 2)
//                        )
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
            .foregroundColor(Color.black) // Text color
    }
}

struct MultiLayerShadowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                ZStack {
                    // Outer shadow
                    Circle()
                        .fill(LinearGradient(colors: [Color(.startWhite), Color(.stopWhite)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 3, y: 3) // Bottom-right shadow
                        .shadow(color: Color.white.opacity(0.7), radius: 0, x: 0, y: -5) // Top-left highlight

                    // Inner button
                    Circle()
                        .fill(Color(.bwhite))
                        .shadow(radius: 1)
                        .padding(10)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
            .foregroundColor(Color.black) // Text color
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Button("Press Me") {
                    print("Button pressed!")
                }
                .buttonStyle(MetallicButtonStyle())

                Button("Press Me") {
                    print("Button pressed!")
                }
                .buttonStyle(RadialMetalButtonStyle())

                Button("Press Me") {
                    print("Button pressed!")
                }
                .buttonStyle(AngularMetalButtonStyle())

                Button("Press Me") {
                    print("Button pressed!")
                }
                .buttonStyle(BlurredMetalButtonStyle())

                Button("") {
                    print("Button pressed!")
                }
                .buttonStyle(NeumorphicButtonStyle())

                Button("") {
                    print("Button pressed!")
                }
                .buttonStyle(NeumorphicButtonStyle2())

                Button("1") {
                    print("Button pressed!")
                }
                .buttonStyle(DarkNeumorphicButtonStyle())

                Button("1") {
                }
                .buttonStyle(GrayNeumorphicButtonStyle())

                Button("1") {
                }
                .buttonStyle(SpottedButtonStyle())
            }
            .padding(100)
        }
    }
}

#Preview {
    ContentView()
}

#Preview(body: {
    Button(action: {}, label: {
        Text("Button")
            .frame(width: 200, height: 100)
    })
    .buttonStyle(MultiLayerShadowButtonStyle())
})
