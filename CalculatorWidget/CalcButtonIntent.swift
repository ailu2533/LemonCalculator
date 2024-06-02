//
//  CalcButtonIntent.swift
//  CalculatorWidgetExtension
//
//  Created by ailu on 2024/6/2.
//

import Foundation
import AppIntents


struct CalcButtonIntent : AppIntent {
    
    static var title: LocalizedStringResource = "Emoji Ranger SuperCharger"
    static var description = IntentDescription("All heroes get instant 100% health.")
    
    
    
    func perform() async throws -> some IntentResult {
//        calc()
        
        return .result()
    }
}
