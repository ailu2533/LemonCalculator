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

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func didTap(button: CalcButton) {
        do {
            // 连续的 equal，不触发计算
            if button == .equal && lastToken == .equal {
                return
            }

            let expression = value
            value = try CalculatorLogic.shared.handleTap(button: button, currentValue: expression, lastToken: lastToken)
            if button == .equal {
                modelContext.insert(History(expression: expression, result: value))
            }
        } catch {
            // todo
        }
        lastToken = button
    }
}
