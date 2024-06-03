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

    @State private var showSettingsSheet = false
    @State private var showSkinSheet = false

    @State private var currentPage = 0
    @State private var isLoading = false

    var theme: any CalculatorTheme

    var body: some View {
        @Bindable var vm = vm

        ZStack {
            Color.mdScreenGreen.ignoresSafeArea()

            VStack(spacing: 0) {
                HistoryView()
                HStack {
                    Spacer()
                    Text(vm.value)
                        .bold()
                        .font(.system(size: 32))
                        .foregroundColor(.mdWhite)
                        .padding(.trailing)
                }

                CalculatorButtonsView(theme: vm.skin.theme)
            }
        }
        .sheet(isPresented: $vm.showSettingsSheet, content: {
            SettingsView()
        })
        .sheet(isPresented: $vm.showSkinSheet, content: {
            CollectionView()
        })
    }
}
