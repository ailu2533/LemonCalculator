//
//  FullCalculatorView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import Foundation
import SwiftData
import SwiftUI

struct FullScreenTheme: CalculatorTheme {
    var background: AnyView {
        AnyView(Rectangle().fill(ImagePaint(image: Image("texture"), scale: 0.1)))
    }

    var texture: String? = "texture"
    var screenTopPadding: CGFloat = 15

    var dividerPadding: CGFloat = 20

    var buttonTextSize: CGFloat = 24

    let horizontalSpacing: CGFloat = 10
    let verticalSpacing: CGFloat = 20
    let gridCellWidth: CGFloat = 45
    let cornerRadius: CGFloat = 12

    let screenBackground: Color = Color(.lightGray)
    let screenTextColor: Color = .white
    let screenHeight: CGFloat = 60
    let screenFontsize: CGFloat = 45
    var screenShadowColor: Color = .black
    var screenShadowRadius: CGFloat = 0.6

    var calculatorBackground: Color = .black.opacity(0.6)
    var buttonBackground: Color = .black
    var buttonShadowColor: Color = .white

    var calculatorPadding: CGFloat = 2
    var calculatorBorderShadowColor: Color = .gray
    var calculatorBorderShadowRadius: CGFloat = 2

    var showBase: Bool = false
    var basePadding: CGFloat = 8
    var baseBackground: Color = .black.opacity(0.4)

    // 按钮颜色
    var functionButtonColor: Color = Color(.lightGray)
    var digitalButtonColor: Color = Color(UIColor(red: 55 / 255.0, green: 55 / 255.0, blue: 55 / 255.0, alpha: 1))
    var operatorButtonColor: Color = Color(.orange)
}

struct FullCalculatorView: View {
    @State private var tapCount = 0

    @Environment(ViewModel.self)
    private var vm

    static var descriptor: FetchDescriptor<History> {
        var descriptor = FetchDescriptor<History>(sortBy: [SortDescriptor(\.createDate, order: .reverse)])
        descriptor.fetchLimit = 30
        return descriptor
    }

    @Query(descriptor)
    private var histories: [History] = []

    @State private var currentPage = 0
    @State private var isLoading = false

    var theme: CalculatorTheme

//    let size: CGSize = .init(width: 338, height: 354)

    var body: some View {
        ZStack {
            Color.classicBlack.ignoresSafeArea()
            VStack(spacing: 0) {
                ScrollView {
                    ScrollViewReader(content: { scrollView in
                        LazyVStack(alignment: .trailing, spacing: 12) {
                            ForEach(histories.reversed()) { history in
                                Text("\(history.expression) = \(history.result)")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.mdWhite)
                            }

                            Rectangle() // 用作滚动到底部的锚点
                                .frame(width: 0, height: 0)
                                .id("bottom")

                        }.padding(.trailing, 15)
                            .onAppear {
                                scrollView.scrollTo("bottom", anchor: .bottom)
                            }
                            .onChange(of: histories) { _, _ in
                                scrollView.scrollTo("bottom", anchor: .bottom)
                            }

                    })
                }

                HStack {
                    Spacer()
                    Text(vm.value)

                        .bold()
                        .font(.system(size: 32))
                        .foregroundColor(.mdWhite).padding(.trailing)
                        .padding(.vertical, 15)
                }


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

                }.padding(.vertical, 20)
                    .containerRelativeFrame(.horizontal)
            }
        }
       
        
     

        .sensoryFeedback(.impact(flexibility: .rigid, intensity: 1), trigger: tapCount)

    }

    func loadHistories(pageSize: Int, pageNumber: Int) -> [History] {
        var fetchDescriptor = FetchDescriptor<History>(sortBy: [SortDescriptor(\.createDate, order: .reverse)])
        fetchDescriptor.fetchOffset = pageNumber * pageSize
        fetchDescriptor.fetchLimit = pageSize

        do {
            return try vm.modelContext.fetch(fetchDescriptor)
        } catch {
            return []
        }
    }

    func didTap(button: CalcButton) {
        vm.didTap(button: button)
    }
}

#Preview {
    FullCalculatorView(theme: ClassicTheme())
}

// https://github.com/or1onsli/Calculator/blob/main/Calculator/CalculatorBrain.swift
