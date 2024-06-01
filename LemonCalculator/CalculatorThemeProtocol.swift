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
    var screenTopPadding: CGFloat { get }

    // 两大功能区的分隔
    var dividerPadding: CGFloat { get }

    var calculatorBackground: Color { get }
    var screenBackground: Color { get }
    var buttonBackground: Color { get }
    var buttonShadowColor: Color { get }
    var buttonTextSize: CGFloat { get }

    var texture: String? { get }

    var calculatorPadding: CGFloat { get }
    var calculatorBorderShadowColor: Color { get }
    var calculatorBorderShadowRadius: CGFloat { get }

    var screenShadowColor: Color { get }
    var screenShadowRadius: CGFloat { get }

    var showBase: Bool { get }
    var baseBackground: Color { get }
    var basePadding: CGFloat { get }

    // 按钮颜色
    var functionButtonColor: Color { get }
    var digitalButtonColor: Color { get }
    var operatorButtonColor: Color { get }

    var background: AnyView { get }
}

extension CalculatorTheme {
    var screenWidth: CGFloat {
        if showBase {
            return 5 * getGridCellWidth() + 4 * horizontalSpacing + 2 * basePadding
        } else {
            return 5 * getGridCellWidth() + 4 * horizontalSpacing
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
        let size = SizeHelper.getLarge()
        let basePaddingValue = showBase ? 2 * basePadding : 0
        return (size.width - (basePaddingValue + 4 * horizontalSpacing + 2 * calculatorPadding)) / 5
    }

    func getFullGridCellWidth() -> CGFloat {
        let size = UIScreen.main.bounds
        let basePaddingValue = showBase ? 2 * basePadding : 0
        return (size.width - (basePaddingValue + 4 * horizontalSpacing + 2 * calculatorPadding)) / 5
    }

    var getFullScreenWidth: CGFloat {
        if showBase {
            return 5 * getFullGridCellWidth() + 4 * horizontalSpacing + 2 * basePadding
        } else {
            return 5 * getFullGridCellWidth() + 4 * horizontalSpacing
        }
    }
}
