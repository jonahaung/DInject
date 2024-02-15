
import XCTest
import SwiftUI
@testable import SwiftUIDI

final class InjectedTests: XCTestCase {
    
    func test_propertyWrapper_onAnonymousRegistration_shouldResolveAnonymousObject() {
        // Given
        class PropertyWrapperContainer {
            @DInjected var helloWorld: String
        }
        let container = PropertyWrapperContainer()
        let expectedResult = "Dag mooie wereld"
        
        // When
        DependencyKey.defaultValue.register(expectedResult)
        let result: String? = container.helloWorld
        
        // Then
        XCTAssertEqual(result, expectedResult, "Resolve returned incorrect object")
    }
    
    func test_propertyWrapper_onLabelTest_shouldObjectWithLabelTest() {
        // Given
        class PropertyWrapperContainer {
            @DInjected(\.helloWorld) var helloWorld: String
        }
        let container = PropertyWrapperContainer()
        let expectedResult = "Dag mooie wereld"
        
        // When
        DependencyKey.defaultValue.register(expectedResult, at: \.helloWorld)
        let result: String? = container.helloWorld
        
        // Then
        XCTAssertEqual(result, expectedResult, "Resolve returned incorrect object")
    }
}

private extension DependencyLabel {
    var helloWorld: String.Type { String.self }
}
