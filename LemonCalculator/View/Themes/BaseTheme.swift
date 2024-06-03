//
//  BaseTheme.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/3.
//

import Foundation
import SwiftUI


class BaseTheme: CalculatorTheme {
    var id: String {
        return "基本"
    }

    var background: AnyView {
        AnyView(
            Rectangle().fill(ImagePaint(image: Image("texture"), scale: 0.1))
                .background(Color.black.opacity(0.6))
        )
    }

    let screenBackground: Color = Color(.lightGray)
    let screenTextColor: Color = .white

    var buttonShadowColor: Color = .white

    var baseBackground: Color {
        .black
    }

    // 按钮颜色
    var functionButtonColor: Color {
        Color(.lightGray)
    }

    var digitalButtonColor: Color {
        Color(UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1))
    }

    var operatorButtonColor: Color {
        Color(.orange)
    }
}
