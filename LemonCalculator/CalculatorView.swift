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

    // 按钮颜色
    override var functionButtonColor: Color {
        Color.mdBrown
    }

    override var digitalButtonColor: Color {
        Color.secondary
    }

    override var operatorButtonColor: Color {
        Color.mdBlue
    }
    
    override var baseBackground: Color {
        Color.mdWhite
    }
}
