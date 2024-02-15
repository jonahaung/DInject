//
//  EnvironmentValues+DIContainer.swift
//  Dependency InjectionDemo
//
//  Created by Aung Ko Min on 16/02/2024.
//

import SwiftUI

public struct DependencyKey: EnvironmentKey {
    public static let defaultValue: Dependencies = Dependencies()
}

public extension EnvironmentValues {
    var dependencies: Dependencies {
        get { return self[DependencyKey.self] }
    }
}
