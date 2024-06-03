//
//  CalculatorThemeProtocol.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import Foundation
import SwiftUI

protocol CalculatorTheme: Identifiable {
    var id: String { get }

    var screenTextColor: Color { get }

    var calculatorBackground: Color { get }
    var screenBackground: Color { get }
    var buttonBackground: Color { get }
    var buttonShadowColor: Color { get }

    var calculatorBorderShadowColor: Color { get }

    var screenShadowColor: Color { get }

    var showBase: Bool { get }
    var baseBackground: Color { get }

    // 按钮颜色
    var functionButtonColor: Color { get }
    var digitalButtonColor: Color { get }
    var operatorButtonColor: Color { get }

    var background: AnyView { get }
}

extension CalculatorTheme {
    var screenWidth: CGFloat {
        if showBase {
            return 5 * getGridCellWidth() + 4 * ThemeConfig.horizontalSpacing + 2 * ThemeConfig.basePadding
        } else {
            return 5 * getGridCellWidth() + 4 * ThemeConfig.horizontalSpacing
        }
    }
}

extension CalculatorTheme {
    func getButtonColor(_ button: CalcButton) -> Color {
        switch button.kind {
        case .digital:
            return digitalButtonColor
        case .operator_:
            return operatorButtonColor
        case .function:
            return functionButtonColor
        }
    }

    func getGridCellWidth() -> CGFloat {
        let size = UIScreen.main.bounds
        let basePaddingValue = showBase ? 2 * ThemeConfig.basePadding : 0
        return (size.width - (basePaddingValue + 4 * ThemeConfig.horizontalSpacing + 2 * ThemeConfig.calculatorPadding)) / 5
    }
}
