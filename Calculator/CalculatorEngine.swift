//
//  CalculatorEngine.swift
//  Calculator
//
//  Created by Sergey Kozlov on 17.10.2025.
//

import SwiftUI
import Combine

class CalculatorEngine: ObservableObject {
    @Published var display: String = ""
    
    func pressKey(key: KeyModel) {
        switch key {
            
        case .digit(let digit):
            display += String(digit)
        case .operation2operands(let sign):
            display += sign
        case .operation1operand(let sign):
            display += sign
        case .reset:
            display = ""
        case .removeLast:
            display.removeLast()
        case .stub:
            
        case .result:
            <#code#>
        }
    }
    
    private func calc() {
        
    }
}
