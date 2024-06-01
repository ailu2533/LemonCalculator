import SwiftUI

let buttons: [[CalcButton]] = [
    [.clear, .seven, .eight, .nine, .add],
    [.negative, .four, .five, .six, .mutliply],
    [.percent, .one, .two, .three, .subtract],
    [.zero, .decimal, .equal, .add],
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

    var buttonColor: Color {
        switch self {
        case .add, .subtract, .mutliply, .divide, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1))
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct CircleButton: ButtonStyle {
    let gridCellWidth: CGFloat
    let backgroundColor: Color
    var foregroundColor: Color = .white

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18))
            .frame(width: gridCellWidth, height: gridCellWidth)
            .foregroundStyle(foregroundColor)
            .background {
                Circle()
                    .fill(backgroundColor)
                    .shadow(color: .white, radius: 2)
            }
    }
}

struct CapsuleButton: ButtonStyle {
    let gridCellWidth: CGFloat
    let horizontalSpacing: CGFloat
    let backgroundColor: Color
    var foregroundColor: Color = .white

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 2 * gridCellWidth + horizontalSpacing, height: gridCellWidth)
            .background(backgroundColor)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .shadow(color: .white, radius: 2)
    }
}



struct ThemeConfiguration {
    let horizontalSpacing: CGFloat = 10
    let verticalSpacing: CGFloat = 10
    let gridCellWidth: CGFloat = 45
    let cornerRadius: CGFloat = 12

    var background: Color = .black
    var screenBackground: Color = .gray
    var buttonBackground: Color = .black
}


struct ContentView: View {
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none

    let horizontalSpacing: CGFloat = 10
    let verticalSpacing: CGFloat = 10
    let gridCellWidth: CGFloat = 45
    let cornerRadius: CGFloat = 12

    var background: Color = .black
    var screenBackground: Color = .gray
    var buttonBackground: Color = .black

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(value)
                    .bold()
                    .font(.system(size: 40))
                    .foregroundColor(.white).padding(.trailing)
            }
            .frame(width: 5 * gridCellWidth + 4 * horizontalSpacing,
                   height: 60,
                   alignment: .trailing)
            .background(screenBackground)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))

            Grid(horizontalSpacing: horizontalSpacing, verticalSpacing: verticalSpacing) {
                ForEach(buttons.indices, id: \.self) { rowIndex in
                    GridRow {
                        ForEach(buttons[rowIndex], id: \.self) { button in
                            if rowIndex == 3 && button == .zero {
                                Button(action: {
                                    self.didTap(button: button)
                                }, label: {
                                    Text(button.rawValue)
                                })
                                .gridCellColumns(2)
                                .buttonStyle(CapsuleButton(gridCellWidth: gridCellWidth, horizontalSpacing: horizontalSpacing, backgroundColor: button.buttonColor, foregroundColor: .white))

                            } else {
                                Button(action: {
                                    self.didTap(button: button)
                                }, label: {
                                    Text(button.rawValue)
                                })
                                .buttonStyle(CircleButton(gridCellWidth: gridCellWidth, backgroundColor: button.buttonColor))
                            }
                        }
                    }
                }
            }
        }
        .padding(10)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .shadow(color: .gray, radius: 3)
    }

    func didTap(button: CalcButton) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
