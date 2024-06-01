import SwiftUI

let buttons: [[CalcButton]] = [
    [.clear, .seven, .eight, .nine, .add],
    [.negative, .four, .five, .six, .mutliply],
    [.percent, .one, .two, .three, .subtract],
    [.del, .zero, .decimal, .equal, .add],
]

enum CalculatorButtonKind: Int {
    case function
    case digital
    case operator_
}

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case mutliply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    case del = "D"

    var background: Color {
        switch self {
        case .add, .subtract, .mutliply, .divide, .equal:
            return .orange
        case .clear, .negative, .percent, .del:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1))
        }
    }

    var kind: CalculatorButtonKind {
        switch self {
        case .add, .subtract, .mutliply, .divide, .equal:
            return .operator_
        case .clear, .negative, .percent, .del:
            return .function
        default:
            return .digital
        }
    }

    var foreground: Color {
        return .white
    }

    var shadowColor: Color {
        return .white
    }

    var shadowRadius: CGFloat {
        return 2
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct CircleButton: ButtonStyle {
    let gridCellWidth: CGFloat
    let buttonBackgroundColor: Color
    var buttonForegroundColor: Color = .white
    var buttonShadowColor: Color = .white
    var buttonShadowRadius: CGFloat = 2
    var buttonTextSize: CGFloat = 18

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: buttonTextSize))
            .frame(width: gridCellWidth, height: gridCellWidth)
            .foregroundStyle(buttonForegroundColor)
            .background {
                Circle()
                    .fill(buttonBackgroundColor)
                    .shadow(color: buttonShadowColor,
                            radius: buttonShadowRadius)
            }
    }
}

struct CalculatorView: View {
    @State private var tapCount = 0

    var theme: CalculatorTheme

    var body: some View {
        VStack(spacing: theme.dividerPadding) {
            HStack {
                Spacer()
                Text("0")
                    .bold()
                    .font(.system(size: theme.screenFontsize))
                    .foregroundColor(theme.screenTextColor).padding(.trailing)
            }
            .frame(width: theme.screenWidth,
                   height: theme.screenHeight,
                   alignment: .trailing)
            .background(theme.screenBackground)
            .clipShape(RoundedRectangle(cornerRadius: theme.cornerRadius))
            .shadow(color: theme.screenShadowColor,
                    radius: theme.screenShadowRadius)
            .padding(.top, theme.screenTopPadding)

            Grid(horizontalSpacing: theme.horizontalSpacing, verticalSpacing: theme.verticalSpacing) {
                ForEach(buttons.indices, id: \.self) { rowIndex in
                    GridRow {
                        ForEach(buttons[rowIndex], id: \.self) { button in

                            let buttonColor = theme.getButtonColor(button)

                            Button(action: {
                                self.tapCount += 1
                                self.didTap(button: button)

                            }, label: {
                                Text(button.rawValue)
                            })
                            .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.gridCellWidth, buttonBackgroundColor: buttonColor, buttonForegroundColor: button.foreground, buttonShadowColor: button.shadowColor, buttonShadowRadius: button.shadowRadius, buttonTextSize: theme.buttonTextSize))
                        }
                    }
                }

            }.padding(theme.basePadding)
                .background {
                    if theme.showBase {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(theme.baseBackground)
                            .shadow(radius: 3)
                    }
                    
                }
        }
        .padding(theme.calculatorPadding)
        .background(ImagePaint(image: Image("texture"), scale: 0.1))
        .clipShape(RoundedRectangle(cornerRadius: theme.cornerRadius))
        .shadow(color: theme.calculatorBorderShadowColor,
                radius: theme.calculatorBorderShadowRadius)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(theme.calculatorBackground)
        }

        .sensoryFeedback(.impact(flexibility: .rigid, intensity: 1), trigger: tapCount)
    }

    func didTap(button: CalcButton) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
//                CalculatorView(theme: ClassicTheme())
//                CalculatorView(theme: ModernTheme())
//                CalculatorView(theme: GeekGreenTheme())
                CalculatorView(theme: MdWhiteTheme())
            }
        }
    }
}



struct MdWhiteTheme: CalculatorTheme {
    var screenTopPadding: CGFloat = 15
    
    var dividerPadding: CGFloat = 20

    var buttonTextSize: CGFloat = 20

    let horizontalSpacing: CGFloat = 10
    let verticalSpacing: CGFloat = 10
    let gridCellWidth: CGFloat = 45
    let cornerRadius: CGFloat = 12

    let screenBackground: Color = Color(.mdScreenGreen)
    let screenTextColor: Color = .black
    let screenHeight: CGFloat = 60
    let screenFontsize: CGFloat = 40
    var screenShadowColor: Color = .black
    var screenShadowRadius: CGFloat = 0.6

    var calculatorBackground: Color = Color(.mdWhite)
    var buttonBackground: Color = .black
    var buttonShadowColor: Color = .white

    var calculatorPadding: CGFloat = 8
    var calculatorBorderShadowColor: Color = .white
    var calculatorBorderShadowRadius: CGFloat = 0

    var showBase: Bool = false
    var basePadding: CGFloat = 8
    var baseBackground: Color = .black.opacity(0.4)
    
    // 按钮颜色
    var functionButtonColor: Color = Color(.mdBrown)
    var digitalButtonColor: Color = Color(UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1))
    var operatorButtonColor: Color = Color(.mdBlue)
    
}



struct GeekGreenTheme: CalculatorTheme {
    var screenTopPadding: CGFloat = 15
    
    var dividerPadding: CGFloat = 20

    var buttonTextSize: CGFloat = 20

    let horizontalSpacing: CGFloat = 10
    let verticalSpacing: CGFloat = 10
    let gridCellWidth: CGFloat = 45
    let cornerRadius: CGFloat = 12

    let screenBackground: Color = Color(.green)
    let screenTextColor: Color = .white
    let screenHeight: CGFloat = 60
    let screenFontsize: CGFloat = 40
    var screenShadowColor: Color = .black
    var screenShadowRadius: CGFloat = 0.6

    var calculatorBackground: Color = .green.opacity(0.8)
    var buttonBackground: Color = .black
    var buttonShadowColor: Color = .white

    var calculatorPadding: CGFloat = 8
    var calculatorBorderShadowColor: Color = .white
    var calculatorBorderShadowRadius: CGFloat = 0

    var showBase: Bool = true
    var basePadding: CGFloat = 8
    var baseBackground: Color = .black.opacity(0.4)
    
    // 按钮颜色
    var functionButtonColor: Color = Color(.blue)
    var digitalButtonColor: Color = Color(UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1))
    var operatorButtonColor: Color = Color(.green)
    
}
