import SwiftUI

let buttons: [[CalcButton]] = [
    [.clear, .leftParen, .rightParen, .del, .divide],
    [.negative, .seven, .eight, .nine, .multiply],
    [.percent, .four, .five, .six, .subtract],
    [.skin, .one, .two, .three, .add],
    [.settings, .zero, .decimal, .equal],
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
    case multiply = "×"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    case del = "D"

    case leftParen = "("
    case rightParen = ")"

    case settings
//    case clearHistory
    case skin

    var background: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .orange
        case .clear, .negative, .percent, .del:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1))
        }
    }

    var kind: CalculatorButtonKind {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .operator_
        case .clear, .negative, .percent, .del:
            return .function
        default:
            return .digital
        }
    }

    @ViewBuilder
    var view: some View {
        switch self {
        case .negative:
            Image(systemName: "plus.forwardslash.minus")
        case .add:
            Image(systemName: "plus")
        case .subtract:
            Image(systemName: "minus")
        case .multiply:
            Image(systemName: "multiply")
        case .divide:
            Image(systemName: "divide")
        case .equal:
            Image(systemName: "equal")
        case .del:
            Image(systemName: "delete.left")
        case .percent:
            Image(systemName: "percent")
        case .settings:
            Image(systemName: "gear")
        case .skin:
            Image(systemName: "tshirt")

        default:
            Text(self.rawValue)
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



class MdWhiteTheme: BaseTheme {
    override var background: AnyView {
        AnyView(Color.clear)
    }
}

struct GeekGreenTheme: CalculatorTheme {
    var id: String {
        "极客绿"
    }

    var background: AnyView {
        AnyView(StripedBackground(stripeColor: Color(hex: "#58a6d1")!,
                                  backgroundColor: Color(hex: "4e94ba")!))
    }

    var texture: String? = nil

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
