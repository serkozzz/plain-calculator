//
//  ModelStandard.swift
//  Calculator
//
//  Created by Sergey Kozlov on 17.10.2025.
//

import SwiftUI
import Combine

class KeyboardModelStandard: ObservableObject {
    var keys: [KeyModel]
    
    init() {
        keys = KeyboardModelStandard.createKeys()
    }
}


extension KeyboardModelStandard {
    private static func createKeys() -> [KeyModel] {
        return [
            KeyModel.removeLast,
            KeyModel.reset,
            KeyModel.operation1operand("%"),
            KeyModel.operation2operands("/"),
            KeyModel.digit(7),
            KeyModel.digit(8),
            KeyModel.digit(9),
            KeyModel.operation2operands("*"),
            KeyModel.digit(4),
            KeyModel.digit(5),
            KeyModel.digit(6),
            KeyModel.operation2operands("-"),
            KeyModel.digit(1),
            KeyModel.digit(2),
            KeyModel.digit(3),
            KeyModel.operation2operands("+"),
            KeyModel.stub,
            KeyModel.digit(0),
            KeyModel.stub,
            KeyModel.reset
        ]
    }
}
