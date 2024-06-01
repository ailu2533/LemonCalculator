//
//  FullCalculatorView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import Foundation
import SwiftUI



struct FullCalculatorView: View {
    @State private var tapCount = 0

    var theme: CalculatorTheme

    let size: CGSize = .init(width: 338, height: 354)
    
    let calculator = Calculator()

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                
            }.background(theme.screenBackground)
            HStack {
                Spacer()
                Text(calculator.value)

                    .bold()
//                    .font(.custom("DigitalNumbers-Regular", size: 24))
                    .foregroundColor(.black).padding(.trailing)
                    .padding(.vertical, 15)
            }
            .background(theme.screenBackground)

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

//        .background {
//            theme.background
//        }

//        .clipShape(RoundedRectangle(cornerRadius: theme.cornerRadius))
//        .shadow(color: theme.calculatorBorderShadowColor,
//                radius: theme.calculatorBorderShadowRadius)
//        .background {
//            RoundedRectangle(cornerRadius: 12)
//                .fill(theme.calculatorBackground)
//        }

        .sensoryFeedback(.impact(flexibility: .rigid, intensity: 1), trigger: tapCount)
        
//        .ignoresSafeArea()
    }

    func didTap(button: CalcButton) {
        calculator.didTap(button: button)
    }
}

#Preview {
    FullCalculatorView(theme: ClassicTheme())
}
