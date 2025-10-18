//
//  ContentView.swift
//  Calculator
//
//  Created by Sergey Kozlov on 16.10.2025.
//

import SwiftUI

struct CalculatorView: View {
    @StateObject private var engine = CalculatorEngine()
    
    var body: some View {
        VStack(spacing: 16) {
            // Экран вывода
            ScrollView(.horizontal, showsIndicators: false) {
                Text(engine.display.isEmpty ? " " : engine.display)
                    .font(.system(size: 40, weight: .medium, design: .default))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
                    .padding(.top, 12)
            }
            .frame(height: 60)
            .background(Color(white: 0.95))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .padding(.horizontal)
            
            // Клавиатура
            KeyboardView { key in
                engine.pressKey(key: key)
            }
        }
        .padding(.bottom)
    }
}

#Preview {
    CalculatorView()
}
