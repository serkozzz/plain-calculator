//
//  ButtonModel.swift
//  Calculator
//
//  Created by Sergey Kozlov on 17.10.2025.
//

enum KeyModel : Hashable {
    case digit(Int)
    case operation2operands(String)
    case operation1operand(String)
    case reset
    case removeLast
    case stub
    case result
    
    func getLabel() -> String {
        switch self {
            
        case .digit(let number):
            return String(number)
        case .operation2operands(let sign):
            return sign
        case .operation1operand(let sign):
            return sign
        case .reset:
            return "AC"
        case .removeLast:
            return "<<"
        case .stub:
            return ""
        case .result:
            return "="
        }
    }
}
