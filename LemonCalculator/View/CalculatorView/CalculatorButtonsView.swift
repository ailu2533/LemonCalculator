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


    init(theme: any CalculatorTheme) {
        self.theme = theme
    }

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
                                                                      buttonShadowRadius: 1,
                                                                      buttonTextSize: ThemeConfig.buttonTextSize))
                        } else {
                            Button(action: {
                                self.tapCount += 1
                                switch button {
                                case .settings:
                                    vm.showSettingsSheet = true
                                case .skin:
                                    vm.showSkinSheet = true
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
                                                                      buttonShadowRadius: 1,
                                                                      buttonTextSize: ThemeConfig.buttonTextSize))
                        }
                    }
                }
            }
        }
        .padding(.vertical, 12)
        .containerRelativeFrame(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(theme.baseBackground)
                .ignoresSafeArea()
        }

        .sensoryFeedback(.impact(flexibility: .rigid, intensity: 1), trigger: tapCount)
     
    }

    func didTap(button: CalcButton) {
        vm.didTap(button: button)
    }
}
