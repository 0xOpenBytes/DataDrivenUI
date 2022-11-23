import SwiftUI
import XCTest
@testable import DataDrivenUI

final class DataDrivenUITests: XCTestCase {
    func testExample() throws {
        struct ExampleComposedView: ComposedView {
            struct Content {
                let name: String
            }

            struct Capabilities {
                let updateName: (String) -> Void
            }

            var content: Content
            var capabilities: Capabilities

            var body: some View {
                Text("Hello, \(content.name)!")
                    .onAppear {
                        capabilities.updateName("\(Date().timeIntervalSince1970)")
                    }
            }
        }

        class ExampleViewProducer: ViewProducing {
            typealias RootView = ExampleComposedView

            @Published private var name: String = "Tests"

            var content: Content {
                Content(name: name)
            }

            var capabilities: Capabilities {
                Capabilities(
                    updateName: update(name:)
                )
            }

            private func update(name: String) {
                self.name = name
            }
        }

        let viewProducer = ExampleViewProducer()

        XCTAssertEqual(viewProducer.content.name, "Tests")

        viewProducer.capabilities.updateName("World")

        XCTAssertEqual(viewProducer.content.name, "World")
    }
}
