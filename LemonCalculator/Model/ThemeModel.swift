//
//  ThemeModel.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import Foundation
import SwiftData

@Model
class Theme {
    var title: String = "未命名"

    var dividerPadding: CGFloat = 20

    var buttonTextSize: CGFloat = 18

    let horizontalSpacing: CGFloat = 10
    let verticalSpacing: CGFloat = 10
    let gridCellWidth: CGFloat = 45
    let cornerRadius: CGFloat = 12

    var screenBackgroundHex: String = "#FFFFFF"
    var screenTextColorHex: String = "#FFFFFF"
    var screenHeight: CGFloat = 60
    var screenFontsize: CGFloat = 40
    var screenShadowColorHex: String = "#FFFFFF"
    var screenShadowRadius: CGFloat = 2

    var calculatorBackground: String = "#FFFFFF"
    var buttonBackground: String = "#FFFFFF"
    var buttonShadowColorHex: String = "#FFFFFF"

    var calculatorPadding: CGFloat = 8
    var calculatorBorderShadowColorHex: String = "#FFFFFF"
    var calculatorBorderShadowRadius: CGFloat = 2

    var showBase: Bool = true

    init() {
    }
}
