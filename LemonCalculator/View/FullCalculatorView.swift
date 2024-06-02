//
//  FullCalculatorView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import Foundation
import SwiftData
import SwiftUI

struct FullCalculatorView: View {
    @State private var tapCount = 0

    @Environment(ViewModel.self)
    private var vm

    @Query private var histories: [History] = []

    var theme: CalculatorTheme

    let size: CGSize = .init(width: 338, height: 354)

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                LazyVStack(alignment: .trailing) {
                    ForEach(histories) { history in
                        Text("\(history.expression) = \(history.result)")
                            .font(.system(size: 20))
                            .foregroundStyle(.secondary)
                    }
                }.padding(.trailing, 15)
            }
//            .contentMargins(.all, 20)
            .background(theme.screenBackground)
            HStack {
                Spacer()
                Text(vm.value)

                    .bold()
                    .font(.system(size: 32))
//                    .font(.custom("DigitalNumbers-Regular", size: 24))
                    .foregroundColor(.black).padding(.trailing)
                    .padding(.vertical, 15)
            }
            .background(theme.screenBackground)
//            .contentMargins(20, for: .automatic)
            .background(content: {
                RoundedRectangle(cornerRadius: theme.cornerRadius)
                    .fill(.white)
            })

            Grid(horizontalSpacing: theme.horizontalSpacing, verticalSpacing: theme.verticalSpacing) {
                ForEach(buttons.indices, id: \.self) { rowIndex in
                    GridRow {
                        ForEach(buttons[rowIndex], id: \.self) { button in

                            let buttonColor = theme.getButtonColor(button)

                            Button(action: {
                                self.tapCount += 1
                                self.didTap(button: button)

                            }, label: {
                                button.view
                            })
                            .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(), buttonBackgroundColor: buttonColor, buttonForegroundColor: button.foreground, buttonShadowColor: button.shadowColor, buttonShadowRadius: button.shadowRadius, buttonTextSize: theme.buttonTextSize))
                        }
                    }
                }

            }.padding(theme.basePadding)
                .containerRelativeFrame(.horizontal)
                .background {
                    if theme.showBase {
                        Rectangle()
                            .fill(theme.baseBackground)
                            .blur(radius: 0.6)
                            .shadow(radius: 3)
                    }
                }
        }

        .sensoryFeedback(.impact(flexibility: .rigid, intensity: 1), trigger: tapCount)

//        .ignoresSafeArea()
    }

    func didTap(button: CalcButton) {
        vm.didTap(button: button)
    }
}

#Preview {
    FullCalculatorView(theme: ClassicTheme())
}


// https://github.com/or1onsli/Calculator/blob/main/Calculator/CalculatorBrain.swift
