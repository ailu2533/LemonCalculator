//
//  FullCalculatorView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import Foundation
import SwiftData
import SwiftUI

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct FullCalculatorView: View {
    @State private var tapCount = 0

    @Environment(ViewModel.self)
    private var vm

    static var descriptor: FetchDescriptor<History> {
        var descriptor = FetchDescriptor<History>(sortBy: [SortDescriptor(\.createDate,order: .reverse)])
        descriptor.fetchLimit = 30
        return descriptor
    }

    @Query(descriptor)
    private var histories: [History] = []

    @State private var currentPage = 0
    @State private var isLoading = false

    var theme: CalculatorTheme

    let size: CGSize = .init(width: 338, height: 354)

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                ScrollViewReader(content: { scrollView in
                    LazyVStack(alignment: .trailing, spacing: 12) {
                        ForEach(histories.reversed()) { history in
                            Text("\(history.expression) = \(history.result)")
                                .font(.system(size: 20))
                                .foregroundStyle(.secondary)
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
//            .contentMargins(.all, 20)
            .background(theme.screenBackground)
            HStack {
                Spacer()
                Text(vm.value)

                    .bold()
                    .font(.system(size: 32))
//                    .font(.custom("DigitalNumbers-Regular", size: 24))
                    .foregroundColor(.black).padding(.trailing)
                    .padding(.vertical, 15)
            }
            .background(theme.screenBackground)
//            .contentMargins(20, for: .automatic)
            .background(content: {
                RoundedRectangle(cornerRadius: theme.cornerRadius)
                    .fill(.white)
            })

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

            }.padding(theme.basePadding)
                .containerRelativeFrame(.horizontal)
                .background {
                    if theme.showBase {
                        Rectangle()
                            .fill(theme.baseBackground)
                            .blur(radius: 0.6)
                            .shadow(radius: 3)
                    }
                }
        }

        .sensoryFeedback(.impact(flexibility: .rigid, intensity: 1), trigger: tapCount)

//        .ignoresSafeArea()
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
