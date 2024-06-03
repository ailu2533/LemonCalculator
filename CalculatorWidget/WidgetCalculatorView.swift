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

            VStack {
                HStack {
                    Button(intent: ClearCalc()) {
                        Text("AC")
                    }
                    Button(intent: SevenCalc()) {
                        Text("7")
                    }
                    Button(intent: EightCalc()) {
                        Text("8")
                    }
                    Button(intent: ClearCalc()) {
                        Text("9")
                    }
                    Button(intent: DivideCalc()) {
                        Image(systemName: "divide")
                    }
                }
                .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: 45, buttonBackgroundColor: .yellow, buttonForegroundColor: .white, buttonShadowColor: .clear, buttonShadowRadius: 0, buttonTextSize: 20))

                HStack {
                    Button(intent: NegativeCalc()) {
                        Image(systemName: "plus.forwardslash.minus")
                    }
                    Button(intent: FourCalc()) {
                        Text("4")
                    }
                    Button(intent: FiveCalc()) {
                        Text("5")
                    }
                    Button(intent: SixCalc()) {
                        Text("6")
                    }
                    Button(intent: MultiplyCalc()) {
                        Image(systemName: "multiply")
                    }
                }.buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: 45, buttonBackgroundColor: .yellow, buttonForegroundColor: .white, buttonShadowColor: .clear, buttonShadowRadius: 0, buttonTextSize: 20))

                HStack {
                    Button(intent: PercentCalc()) {
                        Image(systemName: "percent")
                    }
                    Button(intent: OneCalc()) {
                        Text("1")
                    }
                    Button(intent: TwoCalc()) {
                        Text("2")
                    }
                    Button(intent: ThreeCalc()) {
                        Text("3")
                    }
                    Button(intent: SubtractCalc()) {
                        Image(systemName: "minus")
                    }
                }.buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: 45, buttonBackgroundColor: .yellow, buttonForegroundColor: .white, buttonShadowColor: .clear, buttonShadowRadius: 0, buttonTextSize: 20))

                HStack {
                    Button(intent: DelCalc()) {
                        Image(systemName: "delete.left")
                    }
                    Button(intent: ZeroCalc()) {
                        Text("0")
                    }
                    Button(intent: DecimalCalc()) {
                        Text(".")
                    }
                    Button(intent: EqualCalc()) {
                        Image(systemName: "equal")
                    }
                    Button(intent: AddCalc()) {
                        Image(systemName: "plus")
                    }
                }.buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: 45, buttonBackgroundColor: .yellow, buttonForegroundColor: .white, buttonShadowColor: .clear, buttonShadowRadius: 0, buttonTextSize: 20))
            }

            .padding(theme.basePadding)
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
