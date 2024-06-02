//
//  CalculatorLogic.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/2.
//

import Expression
import Foundation

class CalculatorLogic {
    static let shared = CalculatorLogic()

    private lazy var percentageRegex = try! NSRegularExpression(pattern: "(\\d+(\\.\\d+)?)%", options: [])

    private init() {}

    func handleTap(button: CalcButton, currentValue: String, lastToken: CalcButton?) throws -> String {
        var newValue = currentValue
        switch button {
        case .clear:
            newValue = "0"
        case .del:
            if newValue != "0" {
                newValue = String(newValue.dropLast())
                newValue = replaceLastNumberWithFormatted(in: newValue)
                if newValue.isEmpty {
                    newValue = "0"
                }
            }
        case .equal:
            if lastToken != .equal {
                do {
                    newValue = try evaluateExpression(expression: newValue)
                } catch {
                    throw error
                }
            }
        case .negative:
            newValue = replaceLastNumber(in: newValue)
        case .decimal:
            if newValue.last != "." {
                newValue = handleDecimalInput(currentValue: newValue)
            }
        case .add, .subtract, .multiply, .divide, .percent:
            newValue = handleOperatorInput(button: button, currentValue: newValue)
        default:
            newValue = newValue == "0" ? button.rawValue : replaceLastNumberWithFormatted(in: newValue.appending(button.rawValue))
        }
        return newValue
    }

    private func handleOperatorInput(button: CalcButton, currentValue: String) -> String {
        var newValue = currentValue
        if let lastCharacter = newValue.last, "+-×÷".contains(lastCharacter) {
            newValue.removeLast()
            newValue.append(button.rawValue)
        } else {
            newValue.append(button.rawValue)
        }
        return newValue
    }

    private func handleDecimalInput(currentValue: String) -> String {
        var newValue = currentValue
        if let lastCharacter = newValue.last, !lastCharacter.isNumber {
            newValue.append("0.")
        } else {
            if let lastNumber = extractLastNumber(from: newValue), !lastNumber.contains(".") {
                newValue.append(".")
            }
        }
        return newValue
    }

    private func extractLastNumber(from expression: String) -> String? {
        let pattern = "([0-9]*\\.?[0-9]+)(?!.*[0-9])"
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let range = NSRange(expression.startIndex ..< expression.endIndex, in: expression)
            let matches = regex.matches(in: expression, options: [], range: range)
            if let lastMatch = matches.last {
                let numRange = Range(lastMatch.range, in: expression)!
                return String(expression[numRange])
            }
        } catch {
            print("Regex error: \(error)")
        }
        return nil
    }

    private func evaluateExpression(expression: String) throws -> String {
        // Prepare the expression by replacing symbols and handling percentage expressions
        let preparedExpression = prepareExpressionForEvaluation(expression: expression)

        // Evaluate the mathematical expression using the Expression library
        let evaluator = Expression(preparedExpression)
        do {
            let result = try evaluator.evaluate()
            return formatResult(result) // Assuming `formatted()` is a method that formats the result appropriately
        } catch {
            throw error
        }
    }

    /// Formats the result to retain up to 9 decimal places.
    private func formatResult(_ result: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 9 // Set to 9 to retain up to 9 decimal places
        formatter.usesGroupingSeparator = true // Set to true if you want to use grouping separators like commas

        if let formattedString = formatter.string(from: NSNumber(value: result)) {
            return formattedString
        } else {
            return "\(result)" // Fallback to the default string representation
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

        if let lastCharacter = expression.last,
           [CalcButton.add,
            CalcButton.subtract,
            CalcButton.multiply,
            CalcButton.divide,
            CalcButton.decimal
           ].contains(CalcButton(rawValue: String(lastCharacter))) {
            exp.removeLast()
        }

        return exp
    }

    private func replacePercentageExpressions(in input: String) -> String {
        let range = NSRange(input.startIndex ..< input.endIndex, in: input)
        return percentageRegex.stringByReplacingMatches(in: input, options: [], range: range, withTemplate: "($1*0.01)")
    }

    private func replaceLastNumber(in expression: String) -> String {
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

    private func replaceLastNumberWithFormatted(in expression: String) -> String {
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

                // Format the number if it is an integer (no decimal point)
                if !numberString.contains(".") {
                    if let number = NumberFormatter().number(from: numberString.replacingOccurrences(of: ",", with: "")) {
                        let formatter = NumberFormatter()
                        formatter.numberStyle = .decimal // Customize this to the desired format
                        if let formattedNumber = formatter.string(from: number) {
                            modifiedString.replaceSubrange(numRange, with: formattedNumber)
                        }
                    }
                }
            }

            return modifiedString
        } catch {
            print("Regex error: \(error)")
            return expression
        }
    }
}
