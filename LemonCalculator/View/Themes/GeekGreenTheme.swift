//
//  GeekGreenTheme.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/3.
//

import Foundation
import SwiftUI


struct GeekGreenTheme: CalculatorTheme {
    var background: AnyView {
        AnyView(StripedBackground(stripeColor: Color(hex: "#58a6d1")!,
                                  backgroundColor: Color(hex: "4e94ba")!))
    }

    var texture: String? = nil

    var screenTopPadding: CGFloat = 15

    var dividerPadding: CGFloat = 20

    var buttonTextSize: CGFloat = 20

    let horizontalSpacing: CGFloat = 10
    let verticalSpacing: CGFloat = 10
    let gridCellWidth: CGFloat = 45
    let cornerRadius: CGFloat = 12

    let screenBackground: Color = Color(.green)
    let screenTextColor: Color = .white
    let screenHeight: CGFloat = 60
    let screenFontsize: CGFloat = 40
    var screenShadowColor: Color = .black
    var screenShadowRadius: CGFloat = 0.6

    var calculatorBackground: Color = .green.opacity(0.8)

    var buttonBackground: Color = .black
    var buttonShadowColor: Color = .white

    var calculatorPadding: CGFloat = 8
    var calculatorBorderShadowColor: Color = .white
    var calculatorBorderShadowRadius: CGFloat = 0

    var showBase: Bool = true
    var basePadding: CGFloat = 8
    var baseBackground: Color = Color(hex: "#1a1115")!

    // 按钮颜色
    var functionButtonColor: Color = Color(.blue)
    var digitalButtonColor: Color = Color(UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1))
    var operatorButtonColor: Color = Color(.green)
}
