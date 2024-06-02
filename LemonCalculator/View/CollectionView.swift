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

                    Group {
                        CalculatorView(theme: ClassicTheme())
                       
                        CalculatorView(theme: MdWhiteTheme())
                        CalculatorView(theme: ModernTheme())
                        CalculatorView(theme: GeekGreenTheme())
                    }.allowsHitTesting(false)

                    
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
