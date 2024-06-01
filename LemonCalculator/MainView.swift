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
    var body: some View {
        TabView {
            HomeView().tabItem {
                Label("发现", systemImage: "house")
            }

            CollectionView().tabItem {
                Label("发现", systemImage: "sun.haze")
            }

            SettingsView().tabItem {
                Label("发现", systemImage: "gear")
            }
        }
    }
}

struct Theme2: CalculatorTheme {
    var screenTopPadding: CGFloat = 15

    var dividerPadding: CGFloat = 14

    var buttonTextSize: CGFloat = 14

    let horizontalSpacing: CGFloat = 4
    let verticalSpacing: CGFloat = 10
    let gridCellWidth: CGFloat = 26
    let cornerRadius: CGFloat = 12

    let screenBackground: Color = .yellow
    let screenTextColor: Color = .white
    let screenHeight: CGFloat = 25
    let screenFontsize: CGFloat = 15
    var screenShadowColor: Color = .red
    var screenShadowRadius: CGFloat = 2

    var calculatorBackground: Color = .white
    var buttonBackground: Color = .black
    var buttonShadowColor: Color = .white

    var calculatorPadding: CGFloat = 8
    var calculatorBorderShadowColor: Color = .gray
    var calculatorBorderShadowRadius: CGFloat = 2

    var showBase: Bool = true
    var basePadding: CGFloat = 8
    var baseBackground: Color = .black
    
    
    // 按钮颜色
    var functionButtonColor: Color = Color(.lightGray)
    var digitalButtonColor: Color = Color(UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1))
    var operatorButtonColor: Color = Color(.orange)
}

struct SettingsView: View {
    var body: some View {
        Text("设置")
    }
}

#Preview {
    MainView()
}
