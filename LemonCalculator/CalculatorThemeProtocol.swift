//
//  CalculatorThemeProtocol.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import Foundation
import SwiftUI

protocol CalculatorTheme {
    var horizontalSpacing: CGFloat { get }
    var verticalSpacing: CGFloat { get }
    var gridCellWidth: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var screenHeight: CGFloat { get }
    var screenFontsize: CGFloat { get }
    var screenTextColor: Color { get }
    // 两大功能区的分隔
    var dividerPadding: CGFloat { get }

    var calculatorBackground: Color { get }
    var screenBackground: Color { get }
    var buttonBackground: Color { get }
    var buttonShadowColor: Color { get }
    var buttonTextSize: CGFloat { get }

    var calculatorPadding: CGFloat { get }
    var calculatorBorderShadowColor: Color { get }
    var calculatorBorderShadowRadius: CGFloat { get }

    var screenShadowColor: Color { get }
    var screenShadowRadius: CGFloat { get }
    
    var showBase: Bool {get}
}
