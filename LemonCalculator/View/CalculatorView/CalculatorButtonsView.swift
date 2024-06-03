//
//  CalculatorButtonsView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/3.
//

import SwiftUI

struct CalculatorButtonsView: View {
    @Environment(ViewModel.self)
    private var vm

    var theme: any CalculatorTheme
    @State private var tapCount = 0
    @State private var showSettingsSheet = false
    @State private var showSkinSheet = false

    var body: some View {
        Grid(horizontalSpacing: ThemeConfig.horizontalSpacing, verticalSpacing: ThemeConfig.verticalSpacing) {
            ForEach(buttons.indices, id: \.self) { rowIndex in
                GridRow {
                    ForEach(buttons[rowIndex], id: \.self) { button in
                        let buttonColor = theme.getButtonColor(button)

                        if button == CalcButton.zero {
                            Button(action: {
                                self.tapCount += 1
                                self.didTap(button: button)
                            }, label: {
                                button.view

                            })
                            .gridCellColumns(2)
                            .buttonStyle(MultiLayerShadowButtonStyle3(gridCellHeight: theme.getGridCellWidth(),
                                                                      gridCellWidth: theme.getGridCellWidth() * 2 + ThemeConfig.horizontalSpacing, buttonBackgroundColor: buttonColor,
                                                                      buttonForegroundColor: button.foreground,
                                                                      buttonShadowColor: button.shadowColor,
                                                                      buttonShadowRadius: 0,
                                                                      buttonTextSize: ThemeConfig.buttonTextSize))
                        } else {
                            Button(action: {
                                self.tapCount += 1
                                switch button {
                                case .settings:
                                    showSettingsSheet = true
                                case .skin:
                                    showSkinSheet = true
                                default:
                                    self.didTap(button: button)
                                }
                            }, label: {
                                button.view

                            })
                            .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                                      buttonBackgroundColor: buttonColor,
                                                                      buttonForegroundColor: button.foreground,
                                                                      buttonShadowColor: button.shadowColor,
                                                                      buttonShadowRadius: 0,
                                                                      buttonTextSize: ThemeConfig.buttonTextSize))
                        }
                    }
                }
            }
        }
        .padding(24)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(theme.baseBackground)
                .blur(radius: 0.6)
                .shadow(radius: 3)
                .ignoresSafeArea()
        }

//        .containerRelativeFrame(.horizontal)
        .sensoryFeedback(.impact(flexibility: .rigid, intensity: 1), trigger: tapCount)
        .sheet(isPresented: $showSettingsSheet, content: {
            SettingsView()
        })
        .sheet(isPresented: $showSkinSheet, content: {
            CollectionView()
        })
    }

    func didTap(button: CalcButton) {
        vm.didTap(button: button)
    }
}
