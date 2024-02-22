//
//  StateInjected.swift
//  
//
//  Created by Aung Ko Min on 16/02/2024.
//

import SwiftUI

@propertyWrapper
public struct StateDInjected<Value> {
    private let keyPath: KeyPath<DependencyLabel, Value.Type>?
    
    @State public var wrappedValue: Value
    
     public init(_ keyPath: KeyPath<DependencyLabel, Value.Type>? = nil) {
        self.keyPath = keyPath
        @Environment(\.dependencies) private var dependencies
        
        guard let service: Value = dependencies.resolve(for: keyPath) else {
            fatalError("Service \(Value.self) not registered! See logs for more information")
        }
        
        _wrappedValue = State(initialValue: service)
    }
}
