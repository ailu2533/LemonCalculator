//
//  ThemeEditor.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import SwiftUI

struct ThemeEditor: View {
    var body: some View {
        VStack {
            CalculatorView()
            VStack {
                
                Section("主题"){
                    HStack {
                        Text("极简")
                        Text("拟物")
                        Text("复古")
                    }
                }
                
                Text("材质")

                Text("键盘底座")

                Text("纹理")
            }
        }.toolbar(content: {
            Menu {
                Button("重命名小组件") {
                }

                Button("删除小组件") {
                }
            } label: {
                Image(systemName: "ellipsis")
            }

        })
    }
}

#Preview {
    ThemeEditor()
}
