//
//  Binding-OnChange.swift
//  UltimatePortfolio
//
//  Created by Malcolm Goldiner on 10/6/22.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
        
    }
}
