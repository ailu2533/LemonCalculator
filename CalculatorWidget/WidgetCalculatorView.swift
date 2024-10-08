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

@Observable
class CalcViewModel {
    static let shared = CalcViewModel()

    private init() {
    }

    var currentValue = "0"
}

struct TestIntent: AppIntent {
    static var title: LocalizedStringResource = "Calculator Button"
    static var description = IntentDescription("Calculator Button")

    func perform() async throws -> some IntentResult {
        CalcViewModel.shared.currentValue += "1"

        return .result()
    }
}

struct WidgetCalculatorView: View {
    @State private var tapCount = 0

    var theme: CalculatorTheme

    let size: CGSize = .init(width: 338, height: 354)
    
    @AppStorage("currentValue", store: UserDefaults(suiteName: appGroup))
    var currentValue: String = "0"

    var body: some View {
        VStack(spacing: 14) {
            HStack {
                Spacer()
                Text(currentValue)
                    .lineLimit(1)
                    .bold()
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.black).padding(.trailing)
                    .padding(.vertical, 15)
                    .contentTransition(.identity)
            }
            .background(theme.screenBackground)
            .clipShape(RoundedRectangle(cornerRadius: theme.cornerRadius - 1))
            .padding(1.8)
            .background(content: {
                RoundedRectangle(cornerRadius: theme.cornerRadius)
                    .fill(.white)
            })        .sensoryFeedback(.impact(flexibility: .rigid, intensity: 1), trigger: currentValue)


            .frame(width: theme.screenWidth,
                   alignment: .trailing)

            .shadow(color: theme.screenShadowColor,
                    radius: theme.screenShadowRadius)
            .allowsHitTesting(false)

            VStack {
                HStack {
                    Button(intent: ClearCalc()) {
                        Text("AC")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.functionButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: SevenCalc()) {
                        Text("7")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.digitalButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: EightCalc()) {
                        Text("8")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.digitalButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: NineCalc()) {
                        Text("9")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.digitalButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: DivideCalc()) {
                        Image(systemName: "divide")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.operatorButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))
                }

                HStack {
                    Button(intent: NegativeCalc()) {
                        Image(systemName: "plus.forwardslash.minus")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.functionButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: FourCalc()) {
                        Text("4")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.digitalButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: FiveCalc()) {
                        Text("5")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.digitalButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: SixCalc()) {
                        Text("6")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.digitalButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: MultiplyCalc()) {
                        Image(systemName: "multiply")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.operatorButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))
                }

                HStack {
                    Button(intent: PercentCalc()) {
                        Image(systemName: "percent")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.functionButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: OneCalc()) {
                        Text("1")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.digitalButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: TwoCalc()) {
                        Text("2")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.digitalButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: ThreeCalc()) {
                        Text("3")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.digitalButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: SubtractCalc()) {
                        Image(systemName: "minus")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.operatorButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))
                }
                HStack {
                    Button(intent: DelCalc()) {
                        Image(systemName: "delete.left")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.functionButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: ZeroCalc()) {
                        Text("0")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.digitalButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: DecimalCalc()) {
                        Text(".")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.digitalButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: EqualCalc()) {
                        Image(systemName: "equal")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.digitalButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

                    Button(intent: AddCalc()) {
                        Image(systemName: "plus")
                    }
                    .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(),
                                                              buttonBackgroundColor: theme.operatorButtonColor,
                                                              buttonForegroundColor: .white,
                                                              buttonShadowColor: .clear,
                                                              buttonShadowRadius: 0,
                                                              buttonTextSize: theme.buttonTextSize))

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
            Button(intent: NopIntent()) {
                Color(.systemBackground).opacity(0.01)
            }.buttonStyle(PlainButtonStyle())
        }

        .clipShape(RoundedRectangle(cornerRadius: theme.cornerRadius))
        .shadow(color: theme.calculatorBorderShadowColor,
                radius: theme.calculatorBorderShadowRadius)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(theme.calculatorBackground)
            
        }
//
    }
}
