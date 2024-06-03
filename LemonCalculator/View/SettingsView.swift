//
//  SettingsView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/2.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @Environment(ViewModel.self)
    private var vm

    @Environment(\.dismiss)
    private var dismiss

    @AppStorage("floatPointerNumber") private var floatPointerNumber = 9

    @AppStorage("numberHistoryPresent") private var numberHistoryPresent = 30

    var body: some View {
        NavigationStack {
            Form {
                Picker(selection: $floatPointerNumber) {
                    ForEach(1 ... 12, id: \.self) {
                        Text("\($0)").tag($0)
                    }
                } label: {
                    Text("小数位数")
                }

                Picker(selection: $numberHistoryPresent) {
                    ForEach([5, 30, 100, 200], id: \.self) {
                        Text("\($0)").tag($0)
                    }
                } label: {
                    Text("显示历史记录条数")
                }

                Button(action: {
                    do {
                        try vm.modelContext.delete(model: History.self)
                    } catch {
                    }

                }, label: {
                    Text("清除所有历史记录")
                })

                Section {
                    Text("配置在重启应用后生效")
//                        .font(.caption)
                        .foregroundStyle(.secondary)
                }.scrollContentBackground(.hidden)
                    .listRowBackground(Color.clear)

            }.navigationTitle("设置")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                        }
                    }
                }
        }
    }
}
