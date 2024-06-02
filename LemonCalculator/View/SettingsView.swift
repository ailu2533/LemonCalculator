//
//  SettingsView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/2.
//

import Foundation
import SwiftUI


struct SettingsView: View {
    @AppStorage("floatPointerNumber") private var floatPointerNumber = 9

    var body: some View {
        Form {
            Picker(selection: $floatPointerNumber) {
                ForEach(1 ... 12, id: \.self) {
                    Text("\($0)").tag($0)
                }
            } label: {
                Text("小数位数")
            }
        }
    }
}
