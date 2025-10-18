//
//  CalculatorEngine.swift
//  Calculator
//
//  Created by Sergey Kozlov on 17.10.2025.
//

import SwiftUI
import Combine
import JavaScriptCore

@objc protocol CalculatorBridgeExports: JSExport {
    func swiftFunc()
}


class CalculatorEngine: ObservableObject {
    @Published var display: String = ""
    
    // Контекст JavaScriptCore для выполнения JS
    private let jsContext: JSContext = {
        let context = JSContext()!
        context.exceptionHandler = { _, exception in
            if let exc = exception {
                print("JS Exception: \(exc)")
            }
        }
        return context
    }()
    
    init() {
        loadJavaScriptFromBundle()
        jsContext.setObject(self, forKeyedSubscript: "Bridge" as (NSCopying & NSObjectProtocol))
    }
    

    
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
            if !display.isEmpty {
                display.removeLast()
            }
            
        case .stub:
            break
            
        case .result:
            display = calc()
        }
    }
}

extension CalculatorEngine: CalculatorBridgeExports {
    func swiftFunc() {
        print("Hello swift")
    }
}

extension CalculatorEngine {
    
    // Загружает Calculator.js из бандла и выполняет его в контексте
    private func loadJavaScriptFromBundle() {
        guard let url = Bundle.main.url(forResource: "Calculator", withExtension: "js") else {
            print("Calculator.js not found in bundle.")
            return
        }
        do {
            let source = try String(contentsOf: url, encoding: .utf8)
            jsContext.evaluateScript(source)
        } catch {
            print("Failed to load Calculator.js: \(error)")
        }
    }
    
  
    
    // Выполняет текущее выражение display через JS-функцию evaluate(expr) и возвращает строку
    private func calc() -> String {
        let expr = display.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !expr.isEmpty else { return "" }
        
        // Получаем ссылку на функцию evaluate
        guard let evaluateFn = jsContext.objectForKeyedSubscript("evaluate") else {
            // Если функция не найдена, попробуем разово подгрузить JS и повторить
            loadJavaScriptFromBundle()
            let retryFn = jsContext.objectForKeyedSubscript("evaluate")
            return retryFn?.call(withArguments: [expr])?.toString() ?? ""
        }
        
        // Вызываем evaluate(expr) синхронно
        let result = evaluateFn.call(withArguments: [expr])
        return result?.toString() ?? ""
    }
}

