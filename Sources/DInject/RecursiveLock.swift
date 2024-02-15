//
//  RecursiveLock.swift
//  Dependency InjectionDemo
//
//  Created by Aung Ko Min on 16/02/2024.
//

import Foundation

final class RecursiveLock {
    private let lock = NSRecursiveLock()

    func sync<T>(action: () -> T) -> T {
        lock.lock()
        defer { lock.unlock() }
        return action()
    }
}
