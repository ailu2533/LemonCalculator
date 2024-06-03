//
//  Themes.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import Foundation
import SwiftUI


struct ModernTheme: CalculatorTheme {
    var background: AnyView {
        AnyView(Color.cyan)
    }

    let screenBackground: Color = Color(.clear)
    let screenTextColor: Color = .white

    var calculatorBorderShadowColor: Color = .white

    var baseBackground: Color = .yellow
    // 按钮颜色
    var functionButtonColor: Color = Color(.blue)
    var digitalButtonColor: Color = Color(UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1))
    var operatorButtonColor: Color = Color(.red)
}
