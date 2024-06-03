//
//  NopIntent.swift
//  CalculatorWidgetExtension
//
//  Created by ailu on 2024/6/3.
//

import SwiftUI
import AppIntents

struct NopIntent: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        return .result()
    }
}
