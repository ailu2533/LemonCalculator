//
//  Calculator.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import Foundation

class Calculator {
    // 先前的值
    var value: String = "0"
    var currentOperation: Operation
    var runningNumber: Int

    init(value: String = "0", currentOperation: Operation) {
        self.value = value
        self.currentOperation = currentOperation
        runningNumber = 0
    }

    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .mutliply, .divide, .equal:
            if button == .add {
                currentOperation = .add
                runningNumber = Int(value) ?? 0
            } else if button == .subtract {
                currentOperation = .subtract
                runningNumber = Int(value) ?? 0
            } else if button == .mutliply {
                currentOperation = .multiply
                runningNumber = Int(value) ?? 0
            } else if button == .divide {
                currentOperation = .divide
                runningNumber = Int(value) ?? 0
            } else if button == .equal {
                let runningValue = runningNumber
                let currentValue = Int(value) ?? 0
                switch currentOperation {
                case .add: value = "\(runningValue + currentValue)"
                case .subtract: value = "\(runningValue - currentValue)"
                case .multiply: value = "\(runningValue * currentValue)"
                case .divide: value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }

//            if button != .equal {
//                value = "0"
//            }
        case .clear:
            value = "0"
            currentOperation = .none
        case .decimal, .negative, .percent:
            break
        default:
            let number = button.rawValue
            if value == "0" {
                value = number
            } else {
                value = "\(value)\(number)"
            }
        }
    }
}
