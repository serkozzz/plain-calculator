//
//  ContentView.swift
//  Calculator
//
//  Created by Sergey Kozlov on 16.10.2025.
//

import SwiftUI

struct CalculatorView: View {
    @StateObject var engine = CalculatorEngine()
    var body: some View {
        Text(engine.display)
        KeyboardView() { key in
            engine.pressKey(key: key)
        }
    }
}

#Preview {
    CalculatorView()
}
