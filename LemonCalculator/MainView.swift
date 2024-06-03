//
//  MainView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import SwiftUI

enum CalculatorThemeKind: Int, Identifiable, CaseIterable {
    case classic
    case modern
    case retro
    case dark
    case light
    case neon
    case pastel
    case monochrome

    var id: Self {
        self
    }

    var text: LocalizedStringKey {
        switch self {
        case .classic:
            return "经典"
        case .modern:
            return "现代"
        case .retro:
            return "复古"
        case .dark:
            return "暗黑"
        case .light:
            return "明亮"
        case .neon:
            return "霓虹"
        case .pastel:
            return "粉彩"
        case .monochrome:
            return "单色"
        }
    }

    var theme: CalculatorTheme {
        return Theme2()
    }
}

struct MainView: View {
    @State private var selection = 1

    var body: some View {
        FullCalculatorView(theme: ClassicTheme())
    }
}

#Preview {
    MainView()
}
