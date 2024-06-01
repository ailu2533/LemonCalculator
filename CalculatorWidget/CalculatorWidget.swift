//
//  CalculatorWidget.swift
//  CalculatorWidget
//
//  Created by ailu on 2024/6/1.
//

import SwiftUI
import WidgetKit

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }

    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()

        entries.append(SimpleEntry(date: currentDate, configuration: configuration))

        return Timeline(entries: entries, policy: .never)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct CalculatorWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            if entry.configuration.event?.widgetTitle == "经典" {
                CalculatorView(theme: ClassicTheme())
            } else {
                CalculatorView(theme: MdWhiteTheme())
            }
        }
    }
}

struct CalculatorWidget: Widget {
    let kind: String = "CalculatorWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            CalculatorWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }.contentMarginsDisabled()
            .configurationDisplayName("通用小号小组件")
            .description("首先在[事件Tab]创建事件, 然后在[小组件Tab]为事件创建小号小组件, 然后将小组件添加到桌面")
            .supportedFamilies([.systemLarge])
    }
}

// extension ConfigurationAppIntent {
//    fileprivate static var smiley: ConfigurationAppIntent {
//        let intent = ConfigurationAppIntent()
//        intent.favoriteEmoji = "😀"
//        return intent
//    }
//
//    fileprivate static var starEyes: ConfigurationAppIntent {
//        let intent = ConfigurationAppIntent()
//        intent.favoriteEmoji = "🤩"
//        return intent
//    }
// }
//
// #Preview(as: .systemLarge) {
//    CalculatorWidget()
// } timeline: {
//    SimpleEntry(date: .now, configuration: .smiley)
//    SimpleEntry(date: .now, configuration: .starEyes)
// }
