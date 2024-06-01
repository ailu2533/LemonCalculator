//
//  CollectionView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(CalculatorThemeKind.allCases) { _ in
                       
                        NavigationLink(value: 1) {
                            VStack {
                                CalculatorView(theme: ClassicTheme())
                                Text("名称")
                            }.padding(.bottom, 20)
                                .allowsHitTesting(false)
                        }
//                        .contentShape(Rectangle())
                        .buttonStyle(BorderlessButtonStyle())
                        
                        
                       
                    }
                }
                .navigationDestination(for: Int.self, destination: { _ in
                    ThemeEditor()
                })

            }.scrollIndicators(.hidden)
                .contentMargins(.top, 20)

                .navigationTitle("我的小组件")
                
        }
    }
}

#Preview {
    CollectionView()
}
