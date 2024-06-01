import SwiftUI

let buttons: [[CalcButton]] = [
    [.clear, .seven, .eight, .nine, .add],
    [.negative, .four, .five, .six, .mutliply],
    [.percent, .one, .two, .three, .subtract],
    [.del, .zero, .decimal, .equal, .add],
]

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

struct MultiLayerShadowButtonStyle2: ButtonStyle {
    
    let gridCellWidth: CGFloat
    let buttonBackgroundColor: Color
    var buttonForegroundColor: Color = .white
    var buttonShadowColor: Color = .white
    var buttonShadowRadius: CGFloat = 2
    var buttonTextSize: CGFloat = 18
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 45, height: 45)
            .background(
                ZStack {
                    // Outer shadow
                    Circle()
                        .fill(LinearGradient(colors: [Color(.startWhite), Color(.stopWhite)], startPoint: .topLeading, endPoint: .bottomTrailing))

                        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0.1, y: 0.1) // Bottom-right shadow
                        .shadow(color: Color.white.opacity(0.7), radius: 0, x: 0, y: -0.5) // Top-left highlight

                    // Inner button
                    Circle()
                        .fill(Color(buttonBackgroundColor))
                        .shadow(radius: 1)
                        .padding(1)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
            .foregroundColor(Color.white) // Text color
    }
}

struct Theme1: CalculatorTheme {
    var dividerPadding: CGFloat = 20

    var buttonTextSize: CGFloat = 20

    let horizontalSpacing: CGFloat = 10
    let verticalSpacing: CGFloat = 10
    let gridCellWidth: CGFloat = 45
    let cornerRadius: CGFloat = 12

    let screenBackground: Color = Color(.lightGray)
    let screenTextColor: Color = .white
    let screenHeight: CGFloat = 60
    let screenFontsize: CGFloat = 40
    var screenShadowColor: Color = .black
    var screenShadowRadius: CGFloat = 0.6

    var calculatorBackground: Color = .white
    var buttonBackground: Color = .black
    var buttonShadowColor: Color = .white

    var calculatorPadding: CGFloat = 8
    var calculatorBorderShadowColor: Color = .gray
    var calculatorBorderShadowRadius: CGFloat = 2

    var showBase: Bool = true
}

struct CalculatorView: View {
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none

    @State private var tapCount = 0

    var theme: CalculatorTheme = Theme1()

    var body: some View {
        VStack(spacing: theme.dividerPadding) {
            HStack {
                Spacer()
                Text(value)
                    .bold()
                    .font(.system(size: theme.screenFontsize))
                    .foregroundColor(theme.screenTextColor).padding(.trailing)
            }
            .frame(width: 5 * theme.gridCellWidth + 4 * theme.horizontalSpacing,
                   height: theme.screenHeight,
                   alignment: .trailing)
            .background(theme.screenBackground)
            .clipShape(RoundedRectangle(cornerRadius: theme.cornerRadius))
            .shadow(color: theme.screenShadowColor,
                    radius: theme.screenShadowRadius)
            .padding(.top, 15)

            Grid(horizontalSpacing: theme.horizontalSpacing, verticalSpacing: theme.verticalSpacing) {
                ForEach(buttons.indices, id: \.self) { rowIndex in
                    GridRow {
                        ForEach(buttons[rowIndex], id: \.self) { button in
                            Button(action: {
                                self.tapCount += 1
                                self.didTap(button: button)

                            }, label: {
                                Text(button.rawValue)
                            })
                            .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.gridCellWidth, buttonBackgroundColor: button.background, buttonForegroundColor: button.foreground, buttonShadowColor: button.shadowColor, buttonShadowRadius: button.shadowRadius, buttonTextSize: theme.buttonTextSize))

//                            .buttonStyle(CircleButton(gridCellWidth: theme.gridCellWidth, buttonBackgroundColor: button.background, buttonForegroundColor: button.foreground, buttonShadowColor: button.shadowColor, buttonShadowRadius: button.shadowRadius, buttonTextSize: theme.buttonTextSize))
                        }
                    }
                }
                
            }.padding(8)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.black.opacity(0.3))
                        .shadow(radius: 3)
                }
        }.sensoryFeedback(.impact(flexibility: .rigid, intensity: 1), trigger: tapCount)
        .padding(theme.calculatorPadding)
        .background(ImagePaint(image: Image("texture"), scale: 0.1))
        .clipShape(RoundedRectangle(cornerRadius: theme.cornerRadius))
        .shadow(color: theme.calculatorBorderShadowColor,
                radius: theme.calculatorBorderShadowRadius)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black.opacity(0.5))
        }
    }

    func didTap(button: CalcButton) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
