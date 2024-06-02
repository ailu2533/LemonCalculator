//
//  HistoryManager.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import Foundation

import SwiftData

@Model
class History {
    var id: UUID = UUID()

    var expression: String
    var result: String

    var createDate: Date

    init(expression: String, result: String, createDate: Date = .now) {
        self.expression = expression
        self.result = result
        self.createDate = createDate
    }
}
