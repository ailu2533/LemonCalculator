//
//  CalculatorView.swift
//  CalculatorWidgetExtension
//
//  Created by ailu on 2024/6/2.
//

import AppIntents
import SwiftUI

extension CalcButton {
    var intent: any AppIntent {
        switch self {
        case .one:
            OneCalc()
        case .two:
            TwoCalc()
        case .three:
            ThreeCalc()
        case .four:
            FourCalc()
        case .five:
            FiveCalc()
        case .six:
            SixCalc()
        case .seven:
            SevenCalc()
        case .eight:
            EightCalc()
        case .nine:
            NineCalc()
        case .zero:
            ZeroCalc()
        case .add:
            AddCalc()
        case .subtract:
            SubtractCalc()
        case .divide:
            DivideCalc()
        case .multiply:
            MultiplyCalc()
        case .equal:
            EqualCalc()
        case .clear:
            ClearCalc()
        case .decimal:
            DecimalCalc()
        case .percent:
            PercentCalc()
        case .negative:
            NegativeCalc()
        case .del:
            DelCalc()
        }
    }
}

struct WidgetCalculatorView: View {
    @State private var tapCount = 0

    var theme: CalculatorTheme

    let size: CGSize = .init(width: 338, height: 354)

    var body: some View {
        VStack(spacing: 14) {
            HStack {
                Spacer()
                Text("0000")

                    .bold()
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.black).padding(.trailing)
                    .padding(.vertical, 15)
            }
            .background(theme.screenBackground)
            .clipShape(RoundedRectangle(cornerRadius: theme.cornerRadius - 1))
            .padding(1.8)
            .background(content: {
                RoundedRectangle(cornerRadius: theme.cornerRadius)
                    .fill(.white)
            })

            .frame(width: theme.screenWidth,
                   alignment: .trailing)

            .shadow(color: theme.screenShadowColor,
                    radius: theme.screenShadowRadius)

            Grid(horizontalSpacing: theme.horizontalSpacing, verticalSpacing: theme.verticalSpacing) {
                ForEach(buttons.indices, id: \.self) { rowIndex in
                    GridRow {
                        ForEach(buttons[rowIndex], id: \.self) { button in

                            let buttonColor = theme.getButtonColor(button)
                            
                            Button(intent: OneCalc()) {
                                button.view
                            }

                            .buttonStyle(MultiLayerShadowButtonStyle3(gridCellWidth: theme.getGridCellWidth(), buttonBackgroundColor: buttonColor, buttonForegroundColor: button.foreground, buttonShadowColor: button.shadowColor, buttonShadowRadius: button.shadowRadius, buttonTextSize: theme.buttonTextSize))
                        }
                    }
                }

            }.padding(theme.basePadding)
                .background {
                    if theme.showBase {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(theme.baseBackground)
                            .blur(radius: 0.6)
                            .shadow(radius: 3)
                    }
                }
        }
        .frame(width: size.width, height: size.height)

        .background {
            theme.background
        }

        .clipShape(RoundedRectangle(cornerRadius: theme.cornerRadius))
        .shadow(color: theme.calculatorBorderShadowColor,
                radius: theme.calculatorBorderShadowRadius)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(theme.calculatorBackground)
        }
//
//        .sensoryFeedback(.impact(flexibility: .rigid, intensity: 1), trigger: tapCount)
    }
}
