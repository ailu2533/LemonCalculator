//
//  CalculatorHistoryView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/3.
//

import SwiftUI
import SwiftData


struct HistoryView: View {
    static var descriptor: FetchDescriptor<History> {
        var descriptor = FetchDescriptor<History>(sortBy: [SortDescriptor(\.createDate, order: .reverse)])
        descriptor.fetchLimit = 30
        return descriptor
    }

    @Query(descriptor)
    private var histories: [History] = []

    var body: some View {
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
    }
}
