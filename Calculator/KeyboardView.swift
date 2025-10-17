//
//  ContentView.swift
//  Calculator
//
//  Created by Sergey Kozlov on 16.10.2025.
//

import SwiftUI

struct KeyboardView: View {
    @StateObject var keyboardModel: KeyboardModelStandard = KeyboardModelStandard()
    var onKeyTap: (KeyModel) -> Void

    var body: some View {
        let rows = chunked(keyboardModel.keys, into: 4)

        Grid(alignment: .center, horizontalSpacing: 8, verticalSpacing: 8) {
            ForEach(rows, id: \.self) { row in
                GridRow {
                    ForEach(row, id: \.self) { key in
                        KeyView(keyModel: key, onTap: onKeyTap)
                            .background(.yellow)
                    }
                }
            }
        }
        .padding()
    }

    // Разбивает массив на блоки по size элементов
    private func chunked<T>(_ array: [T], into size: Int) -> [[T]] {
        guard size > 0 else { return [] }
        return stride(from: 0, to: array.count, by: size).map {
            Array(array[$0..<min($0 + size, array.count)])
        }
    }
}

#Preview {
    KeyboardView()
}
