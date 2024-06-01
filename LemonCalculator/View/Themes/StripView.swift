//
//  StripView.swift
//  LemonCalculator
//
//  Created by ailu on 2024/6/1.
//

import SwiftUI

struct StripedBackground: View {
    var stripeWidth: CGFloat = 4
    var stripeSpacing: CGFloat = 4
    var stripeColor: Color = .gray
    var backgroundColor: Color = .white

    var body: some View {
        GeometryReader { _ in
            Canvas { context, size in
                let numberOfStripes = Int(size.width / (stripeWidth + stripeSpacing))
                for i in 0 ..< numberOfStripes {
                    let xPosition = CGFloat(i) * (stripeWidth + stripeSpacing)
                    var path = Path()
                    path.addRect(CGRect(x: xPosition, y: 0, width: stripeWidth, height: size.height))
                    context.fill(path, with: .color(stripeColor))
                }
            }
            .background(backgroundColor)
        }
    }
}

#Preview {
    StripedBackground(stripeColor: Color(hex: "#58a6d1")!,
                      backgroundColor: Color(hex: "4e94ba")!)
    .blur(radius: 0.8)
        .frame(width: 200, height: 100)
}
