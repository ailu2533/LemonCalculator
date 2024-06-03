//
//  CollectionView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import SwiftUI

enum SkinKind: Int, CaseIterable, Identifiable {
    case base = 0
    case white = 1
    case green = 2
    case colorful = 3

    var id: Self {
        self
    }

    var text: LocalizedStringKey {
        switch self {
        case .base:
            "经典"
        case .white:
            "白色"
        case .green:
            "绿色"
        case .colorful:
            "多彩"
        }
    }

    var theme: any CalculatorTheme {
        switch self {
        case .base:
            BaseTheme()
        case .white:
            MdWhiteTheme()
        case .green:
            ModernTheme()
        case .colorful:
            GeekGreenTheme()
        }
    }
}

struct CollectionView: View {
    @Environment(ViewModel.self)
    private var vm

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 10) {
                    Group {
                        ForEach(SkinKind.allCases) { kind in
                            VStack {
                                CalculatorButtonsView(theme: kind.theme)
                                    .scaleEffect(0.85)
                                    .allowsHitTesting(false)
                                HStack {
                                    Spacer()
                                    Text(kind.text)
                                    Spacer()
                                    Button(action: {
                                        vm.skin = kind
                                        withAnimation {
                                            dismiss()
                                        }
                                    }, label: {
                                        Text(kind == vm.skin ? "使用中" : "使用")
                                    })
                                    .buttonStyle(MultiLayerShadowButtonStyle3(gridCellHeight: 40, gridCellWidth: 80, buttonBackgroundColor: kind == vm.skin ? .accentColor : Color(.systemGray3), buttonForegroundColor: .white, buttonShadowColor: .clear, buttonShadowRadius: 0, buttonTextSize: 20))

                                    Spacer()
                                }
                            }
                        }
                    }
                }

            }.scrollIndicators(.hidden)
                .navigationTitle("皮肤")
                .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CollectionView()
}
