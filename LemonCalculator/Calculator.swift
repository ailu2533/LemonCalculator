//
//  Calculator.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import Expression
import Foundation


@Observable
class Calculator {
    // 保存输入的数据0
    // 当用户输入等于时，触发计算。将等式写入历史记录中。将 value 设置为计算结果
    // 当用户输入AC时，将 value 设置为 "0"
    // 当用户输入 del 时，将 value 的最后一个字符去掉，
    // 如果 value 为 0，则不处理
    // 如果去掉最后一个字符后为空，则将 value 设置为 0.
    // 如果输入其他的字符，则直接 append 到 value

    var value: String = "0"

    init() {
    }

    func didTap(button: CalcButton) {
        switch button {
        case .clear:
            value = "0"
        case .del:
            if value != "0" {
                value = String(value.dropLast())
                if value.isEmpty {
                    value = "0"
                }
            }
        case .equal:
            value = evaluateExpression(expression: value)
        default:
            if value == "0" {
                value = button.rawValue
            } else {
                value.append(button.rawValue)
            }
        }
    }

    private func evaluateExpression(expression: String) -> String {
        // This function should contain the logic to evaluate the mathematical expression
        // For simplicity, let's assume it returns the input for now
        let exp = value.replacingOccurrences(of: "x", with: "*")
        let expression = Expression(exp)
        do {
            let result = try expression.evaluate()
            return result.formatted()
        } catch {
            print(error)
            return "Error"
        }
    }
}
