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

    var buttonTextSize: CGFloat = 30

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

    @AppStorage("skin") private var skin = "Classic"

    @State private var showSettingsSheet = false
    @State private var showSkinSheet = false

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

    var body: some View {
        VStack(spacing: 10) {
            ScrollViewReader { scrollView in

                ScrollView {
                    LazyVStack(alignment: .trailing, spacing: 12) {
                        ForEach(histories.reversed()) { history in
                            HStack {
                                Text("\(history.expression)")
                                Text("=")
                                Text("\(history.result)")
                                    .fontWeight(.medium)
                                    .padding(3)
                                    .frame(minWidth: 40)
                                    .background {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.blue)
                                    }
                            }.foregroundStyle(Color.white)
                        }

                        Rectangle() // 用作滚动到底部的锚点
                            .frame(width: 0, height: 0)
                            .id("bottom")

                    }.padding(.trailing, 15)

                }.onAppear {
                    withAnimation {
                        scrollView.scrollTo("bottom", anchor: .bottom)
                    }
                }
                .onChange(of: histories) { _, _ in
                    withAnimation {
                        scrollView.scrollTo("bottom", anchor: .bottom)
                    }
                }
            }
            .padding(.top, 10)

            HStack {
                Spacer()
                Text(vm.value)
                    .bold()
                    .font(.system(size: 32))
                    .foregroundColor(.mdWhite).padding(.trailing)
            }

            Grid(horizontalSpacing: theme.horizontalSpacing, verticalSpacing: theme.verticalSpacing) {
                ForEach(buttons.indices, id: \.self) { rowIndex in
                    GridRow {
                        ForEach(buttons[rowIndex], id: \.self) { button in

                            let buttonColor = theme.getButtonColor(button)

                            if button == CalcButton.zero {
                                Button(action: {
                                    self.tapCount += 1
                                    self.didTap(button: button)

                                }, label: {
                                    button.view
                                        .fontWeight(.bold)
                                })
                                .gridCellColumns(2)

                                .buttonStyle(MultiLayerShadowButtonStyle3(gridCellHeight: theme.getGridCellWidth(), gridCellWidth: theme.getGridCellWidth() * 2 + theme.horizontalSpacing, buttonBackgroundColor: buttonColor, buttonForegroundColor: button.foreground, buttonShadowColor: button.shadowColor, buttonShadowRadius: button.shadowRadius, buttonTextSize: theme.buttonTextSize))
                            } else {
                                Button(action: {
                                    self.tapCount += 1
                                    switch button {
                                    case .settings:
                                        showSettingsSheet = true
                                    case .skin:
                                        showSkinSheet = true
                                    default:
                                        self.didTap(button: button)
                                    }
                                }, label: {
                                    button.view
                                        .fontWeight(.bold)
                                })

                                .buttonStyle(MultiLayerShadowButtonStyle2(gridCellWidth: theme.getGridCellWidth(), buttonBackgroundColor: buttonColor, buttonForegroundColor: button.foreground, buttonShadowColor: button.shadowColor, buttonShadowRadius: button.shadowRadius, buttonTextSize: theme.buttonTextSize))
                            }
                        }
                    }
                }
            }
            .padding(.vertical, 20)
            .containerRelativeFrame(.horizontal)
        }
        .background(Color.classicBlack.ignoresSafeArea())

        .sensoryFeedback(.impact(flexibility: .rigid, intensity: 1), trigger: tapCount)
        .sheet(isPresented: $showSettingsSheet, content: {
            SettingsView()
        })
        .sheet(isPresented: $showSkinSheet, content: {
            CollectionView()
        })
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
