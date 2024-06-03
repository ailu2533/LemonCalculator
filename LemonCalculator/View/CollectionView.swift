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
                        CalculatorView(theme: BaseTheme())
                        CalculatorView(theme: MdWhiteTheme())
                        CalculatorView(theme: ModernTheme())
                        CalculatorView(theme: GeekGreenTheme())
                    }
                    .padding()
                    .allowsHitTesting(false)

                    
                }
          

            }.scrollIndicators(.hidden)
                .contentMargins(.top, 20)

                .navigationTitle("我的小组件")
                .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CollectionView()
}
