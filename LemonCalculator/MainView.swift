//
//  MainView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import SwiftUI


struct MainView: View {
    @State private var selection = 1

    var body: some View {
        FullCalculatorView(theme: BaseTheme())
    }
}

#Preview {
    MainView()
}
