//
//  AppIntent.swift
//  CalculatorWidget
//
//  Created by ailu on 2024/6/1.
//

import AppIntents
import WidgetKit

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "小组件")
    var event: WidgetEntityQuerySmall?
}

import AppIntents
import Foundation
import SwiftData

struct WidgetModelSmallEntityQuery: EntityQuery {
    func entities(for identifiers: [String]) async throws -> [WidgetEntityQuerySmall] {
        return WidgetModelSmallEntityQuery.allWidgetThemes.filter { identifiers.contains($0.id) }
    }

    func suggestedEntities() async throws -> [WidgetEntityQuerySmall] {
        return WidgetModelSmallEntityQuery.allWidgetThemes
    }

    func defaultResult() async -> WidgetEntityQuerySmall? {
        return WidgetEntityQuerySmall(widgetTitle: "经典")
    }

    static var allWidgetThemes: [WidgetEntityQuerySmall] {
        return [
            WidgetEntityQuerySmall(widgetTitle: "经典"),
            WidgetEntityQuerySmall(widgetTitle: "复古"),
        ]
    }
}

// Implementation of WidgetModelSmall
struct WidgetEntityQuerySmall: AppEntity {
    var id: String {
        widgetTitle
    }

    static var defaultQuery: WidgetModelSmallEntityQuery {
        return WidgetModelSmallEntityQuery()
    }

    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        return TypeDisplayRepresentation(name: "Small Widget")
    }

    var displayRepresentation: DisplayRepresentation {
        return DisplayRepresentation(title: "\(widgetTitle)")
    }

    // 标题
    var widgetTitle: String
}
