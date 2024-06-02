//
//  Theme2.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/2.
//

import Foundation
import SwiftUI

struct Theme2: CalculatorTheme {
    var background: AnyView {
        AnyView(Color.clear)
    }

    var texture: String? = nil

    var screenTopPadding: CGFloat = 15

    var dividerPadding: CGFloat = 14

    var buttonTextSize: CGFloat = 14

    let horizontalSpacing: CGFloat = 4
    let verticalSpacing: CGFloat = 10
    let gridCellWidth: CGFloat = 26
    let cornerRadius: CGFloat = 12

    let screenBackground: Color = .yellow
    let screenTextColor: Color = .white
    let screenHeight: CGFloat = 25
    let screenFontsize: CGFloat = 15
    var screenShadowColor: Color = .red
    var screenShadowRadius: CGFloat = 2

    var calculatorBackground: Color = .white
    var buttonBackground: Color = .black
    var buttonShadowColor: Color = .white

    var calculatorPadding: CGFloat = 8
    var calculatorBorderShadowColor: Color = .gray
    var calculatorBorderShadowRadius: CGFloat = 2

    var showBase: Bool = true
    var basePadding: CGFloat = 8
    var baseBackground: Color = .black

    // 按钮颜色
    var functionButtonColor: Color = Color(.lightGray)
    var digitalButtonColor: Color = Color(UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1))
    var operatorButtonColor: Color = Color(.orange)
}
