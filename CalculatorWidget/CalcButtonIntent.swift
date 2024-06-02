//
//  CalcButtonIntent.swift
//  CalculatorWidgetExtension
//
//  Created by ailu on 2024/6/2.
//

import AppIntents
import Foundation

let appGroup = "group.top.lemonapp.calculator"
let currentValueKey = "currentValue"
let lastTokenKey = "lastToken"

// case one = "1"
// case two = "2"
// case three = "3"
// case four = "4"
// case five = "5"
// case six = "6"
// case seven = "7"
// case eight = "8"
// case nine = "9"
// case zero = "0"
// case add = "+"
// case subtract = "-"
// case divide = "÷"
// case multiply = "×"
// case equal = "="
// case clear = "AC"
// case decimal = "."
// case percent = "%"
// case negative = "-/+"
// case del = "D"

func getCurrentValue() -> String {
    return UserDefaults(suiteName: appGroup)?.value(forKey: currentValueKey) as? String ?? "0"
}

func getLastToken() -> CalcButton? {
    let lastTokenString = UserDefaults(suiteName: appGroup)?.value(forKey: currentValueKey) as? String
    let lastToken: CalcButton? = lastTokenString != nil ? CalcButton(rawValue: lastTokenString!) : nil
    return lastToken
}

func setCurrentValue(_ result: String) {
    UserDefaults(suiteName: appGroup)?.set(result, forKey: currentValueKey)
}

struct OneCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.one.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .one, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct TwoCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.one.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .two, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct ThreeCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.three.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .three, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct FourCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.four.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .four, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct FiveCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.five.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .five, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct SixCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.six.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .six, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct SevenCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.seven.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .seven, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct EightCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.eight.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .eight, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct NineCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.nine.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .nine, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct ZeroCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.zero.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .zero, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct AddCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.add.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .add, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct SubtractCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.subtract.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .subtract, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct DivideCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.divide.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .divide, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct MultiplyCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.multiply.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .multiply, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct EqualCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.equal.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .equal, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct ClearCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.clear.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .clear, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct DecimalCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.decimal.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .decimal, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct PercentCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.percent.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .percent, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct NegativeCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.negative.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .negative, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

struct DelCalc: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroup)?.set(CalcButton.del.rawValue, forKey: lastTokenKey)

        do {
            let result = try CalculatorLogic.shared.handleTap(button: .del, currentValue: getCurrentValue(),
                                                              lastToken: getLastToken())
            setCurrentValue(result)

        } catch {
        }

        return .result()
    }
}

extension OneCalc: Identifiable {
    var id: CalcButton {
        CalcButton.one
    }
}

extension TwoCalc: Identifiable {
    var id: CalcButton {
        CalcButton.two
    }
}

extension ThreeCalc: Identifiable {
    var id: CalcButton {
        CalcButton.three
    }
}

extension FourCalc: Identifiable {
    var id: CalcButton {
        CalcButton.four
    }
}

extension FiveCalc: Identifiable {
    var id: CalcButton {
        CalcButton.five
    }
}

extension SixCalc: Identifiable {
    var id: CalcButton {
        CalcButton.six
    }
}

extension SevenCalc: Identifiable {
    var id: CalcButton { .seven }
}

extension EightCalc: Identifiable {
    var id: CalcButton { .eight }
}

extension NineCalc: Identifiable {
    var id: CalcButton { .nine }
}

extension ZeroCalc: Identifiable {
    var id: CalcButton { .zero }
}

extension AddCalc: Identifiable {
    var id: CalcButton { .add }
}

extension SubtractCalc: Identifiable {
    var id: CalcButton { .subtract }
}

extension MultiplyCalc: Identifiable {
    var id: CalcButton { .multiply }
}

extension DivideCalc: Identifiable {
    var id: CalcButton { .divide }
}

extension EqualCalc: Identifiable {
    var id: CalcButton { .equal }
}

extension ClearCalc: Identifiable {
    var id: CalcButton { .clear }
}

extension DecimalCalc: Identifiable {
    var id: CalcButton { .decimal }
}

extension PercentCalc: Identifiable {
    var id: CalcButton { .percent }
}

extension NegativeCalc: Identifiable {
    var id: CalcButton { .negative }
}

extension DelCalc: Identifiable {
    var id: CalcButton { .del }
}
