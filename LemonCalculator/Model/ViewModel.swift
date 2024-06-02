//
//  ViewModel.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/2.
//

import Expression
import Foundation
import SwiftData

@Observable
class ViewModel {
    var modelContext: ModelContext
    var value: String = "0"

    @ObservationIgnored
    var lastToken: CalcButton?
    
    @ObservationIgnored
    private var percentageRegex = try! NSRegularExpression(pattern: "(\\d+(\\.\\d+)?)%", options: [])

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    // 保存输入的数据0
    // 当用户输入等于时，触发计算。将等式写入历史记录中。将 value 设置为计算结果
    // 当用户输入AC时，将 value 设置为 "0"
    // 当用户输入 del 时，将 value 的最后一个字符去掉，
    // 如果 value 为 0，则不处理
    // 如果去掉最后一个字符后为空，则将 value 设置为 0.
    // 如果输入其他的字符，则直接 append 到 value

    func didTap(button: CalcButton) {
        switch button {
        case .clear:
            value = "0"
        case .del:
            if value != "0" {
                value = String(value.dropLast())
                value = replaceLastNumberWithFormatted(in: value)
                if value.isEmpty {
                    value = "0"
                }
            }
        case .equal:
            if lastToken != .equal {
                let result = evaluateExpression(expression: value)
                if result != "Error" {
                    modelContext.insert(History(expression: value, result: result))
                    value = result
                }
            }
        case .negative:
            value = replaceLastNumber(in: value)
        case .decimal, .add, .subtract, .mutliply, .divide:
            value = value == "0" ? button.rawValue : value.appending(button.rawValue)
        default:
            value = value == "0" ? button.rawValue : replaceLastNumberWithFormatted(in: value.appending(button.rawValue))
        }
        lastToken = button
    }

    func replacePercentageExpressions(in input: String) -> String {
        let range = NSRange(input.startIndex..<input.endIndex, in: input)
        return percentageRegex.stringByReplacingMatches(in: input, options: [], range: range, withTemplate: "($1*0.01)")
    }

    func replaceLastNumber(in expression: String) -> String {
        // 正则表达式匹配可能包含逗号的数字或(-1*d)模式
        let pattern = "([+-]?)([a-zA-Z0-9,.]+|\\(-1\\×[a-zA-Z0-9,.]+\\))(?!.*[a-zA-Z0-9,.])"

        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let range = NSRange(expression.startIndex ..< expression.endIndex, in: expression)
            var modifiedString = expression

            let matches = regex.matches(in: expression, options: [], range: range)
            if let lastMatch = matches.last {
                let opRange = Range(lastMatch.range(at: 1), in: expression)!
                let numRange = Range(lastMatch.range(at: 2), in: expression)!

                let operatorSymbol = String(expression[opRange])
                var number = String(expression[numRange])

                // Check if the number is in the format (-1*d) and revert it
                if number.hasPrefix("(-1×") && number.hasSuffix(")") {
                    number = String(number.dropFirst(4).dropLast(1))
                } else {
                    // Apply the previous logic
                    switch operatorSymbol {
                    case "-":
                        number = "+\(number)"
                    case "+":
                        number = "-\(number)"
                    default:
                        number = "(-1×\(number))"
                    }
                }

                if let replacementRange = Range(lastMatch.range, in: expression) {
                    modifiedString.replaceSubrange(replacementRange, with: number)
                }
            }

            // Remove leading '+' if it exists
            if modifiedString.first == "+" {
                modifiedString.removeFirst()
            }

            return modifiedString
        } catch {
            print("Regex error: \(error)")
            return expression
        }
    }

    func replaceLastNumberWithFormatted(in expression: String) -> String {
        // 正则表达式匹配最后一个纯数字，不包括任何前置符号
        let pattern = "([0-9,]+\\.?[0-9]*)(?!.*[0-9])"

        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let range = NSRange(expression.startIndex ..< expression.endIndex, in: expression)
            var modifiedString = expression

            let matches = regex.matches(in: expression, options: [], range: range)
            if let lastMatch = matches.last {
                let numRange = Range(lastMatch.range, in: expression)!
                let numberString = String(expression[numRange])

                // Format the number
                if let number = NumberFormatter().number(from: numberString.replacingOccurrences(of: ",", with: "")) {
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .decimal // Customize this to the desired format
                    if let formattedNumber = formatter.string(from: number) {
                        modifiedString.replaceSubrange(numRange, with: formattedNumber)
                    }
                }
            }

            return modifiedString
        } catch {
            print("Regex error: \(error)")
            return expression
        }
    }

    private func evaluateExpression(expression: String) -> String {
        // Prepare the expression by replacing symbols and handling percentage expressions
        let preparedExpression = prepareExpressionForEvaluation(expression: expression)

        // Evaluate the mathematical expression using the Expression library
        let evaluator = Expression(preparedExpression)
        do {
            let result = try evaluator.evaluate()
            return result.formatted()  // Assuming `formatted()` is a method that formats the result appropriately
        } catch {
            // Return a formatted error message instead of just "Error"
            return "Error: \(error.localizedDescription)"
        }
    }

    /// Prepares the mathematical expression by replacing symbols and handling percentage expressions.
    private func prepareExpressionForEvaluation(expression: String) -> String {
        var exp = expression
            .replacingOccurrences(of: "×", with: "*")
            .replacingOccurrences(of: "÷", with: "/")
            .replacingOccurrences(of: ",", with: "")
        
        // Replace percentage expressions with their mathematical equivalents
        exp = replacePercentageExpressions(in: exp)
        return exp
    }
}
