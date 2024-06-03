//
//  FullCalculatorView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import Foundation
import SwiftData
import SwiftUI

struct FullCalculatorView: View {
    @State private var tapCount = 0

    @Environment(ViewModel.self)
    private var vm

    @AppStorage("skin") private var skin = "Classic"

    @State private var showSettingsSheet = false
    @State private var showSkinSheet = false

    @State private var currentPage = 0
    @State private var isLoading = false

    var theme: any CalculatorTheme

    var body: some View {
        VStack(spacing: 10) {
            HistoryView()

            HStack {
                Spacer()
                Text(vm.value)
                    .bold()
                    .font(.system(size: 32))
                    .foregroundColor(.mdWhite)
                    .padding(.trailing)
            }

            CalculatorButtonsView(theme: theme)
        }
        .background(theme.background.ignoresSafeArea())
    }
}
