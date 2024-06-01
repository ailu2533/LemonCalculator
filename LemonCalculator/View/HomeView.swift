//
//  HomeView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],
                          spacing: 20, content: {
                              ForEach(CalculatorThemeKind.allCases) { themeKind in

                                  VStack {
                                      CalculatorView(theme: themeKind.theme)
                                      Text(themeKind.text)
                                  }.allowsHitTesting(false)
                                  
                                  
                                  
                              }
                          })
            }
            

            .scrollIndicators(.hidden)
            .contentMargins(.top, 20)
            .padding(.horizontal, 10)
            .navigationTitle("发现")
        }
    }
}

#Preview {
    HomeView()
}
