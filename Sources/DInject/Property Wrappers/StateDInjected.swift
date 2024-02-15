//
//  StateInjected.swift
//  
//
//  Created by Aung Ko Min on 16/02/2024.
//

import SwiftUI

@propertyWrapper
struct StateDInjected<Value> {
    private let keyPath: KeyPath<DependencyLabel, Value.Type>?
    
    @State var wrappedValue: Value
    
    init(_ keyPath: KeyPath<DependencyLabel, Value.Type>? = nil) {
        self.keyPath = keyPath
        let dependencies = Environment(\.dependencies).wrappedValue
        
        guard let service: Value = dependencies.resolve(for: keyPath) else {
            fatalError("Service \(Value.self) not registered! See logs for more information")
        }
        
        _wrappedValue = State(initialValue: service)
    }
}
