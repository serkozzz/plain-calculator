//
//  ContentView.swift
//  Calculator
//
//  Created by Sergey Kozlov on 16.10.2025.
//

import SwiftUI

struct KeyView: View {
    var keyModel: KeyModel
    var onTap: (KeyModel) -> Void
    var body: some View {
        GeometryReader { proxy in
            let diameter = min(proxy.size.width, proxy.size.height)
            Circle().fill(.gray)
                .overlay {
                    let fontSize = diameter * 0.5

                    Text(keyModel.getLabel())
                        .font(.system(size: fontSize, weight: .regular, design: .default))

                        .lineLimit(1)
                        
                }
                .onTapGesture {
                    onTap(self.keyModel)
                }
        }

        //.frame(width: 64, height: 64)
    }
}

#Preview {
    KeyView(keyModel: .digit(5)) { _ in
        
    }
}
