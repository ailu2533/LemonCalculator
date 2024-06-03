//
//  FullScreenTheme.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/3.
//

import SwiftUI

struct FullScreenTheme: CalculatorTheme {
    var background: AnyView {
        AnyView(Rectangle().fill(ImagePaint(image: Image("texture"), scale: 0.1)))
    }

    var texture: String? = "texture"
    var screenTopPadding: CGFloat = 15

    var dividerPadding: CGFloat = 20

    var buttonTextSize: CGFloat = 30

    let horizontalSpacing: CGFloat = 10
    let verticalSpacing: CGFloat = 20
    let gridCellWidth: CGFloat = 45
    let cornerRadius: CGFloat = 12

    let screenBackground: Color = Color(.lightGray)
    let screenTextColor: Color = .white
    let screenHeight: CGFloat = 60
    let screenFontsize: CGFloat = 45
    var screenShadowColor: Color = .black
    var screenShadowRadius: CGFloat = 0.6

    var calculatorBackground: Color = .black.opacity(0.6)
    var buttonBackground: Color = .black
    var buttonShadowColor: Color = .white

    var calculatorPadding: CGFloat = 2
    var calculatorBorderShadowColor: Color = .gray
    var calculatorBorderShadowRadius: CGFloat = 2

    var showBase: Bool = false
    var basePadding: CGFloat = 8
    var baseBackground: Color = .black.opacity(0.4)

    // 按钮颜色
    var functionButtonColor: Color = Color(.lightGray)
    var digitalButtonColor: Color = Color(UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1))
    var operatorButtonColor: Color = Color(.orange)
}
