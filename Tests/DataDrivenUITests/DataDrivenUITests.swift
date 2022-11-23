import SwiftUI
import XCTest
@testable import DataDrivenUI

final class DataDrivenUITests: XCTestCase {
    func testExample() {
        struct ExampleComposedView: ComposableView {
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
            typealias ComposedView = ExampleComposedView

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

    func testCounter() {
        struct CounterView: ComposableView {
            struct Content {
                let count: String
            }

            struct Capabilities {
                let increment: () -> Void
                let decrement: () -> Void
            }

            let content: Content
            let capabilities: Capabilities

            var body: some View {
                VStack {
                    Text(content.count)
                    HStack {
                        Button(action: capabilities.decrement, label: { Text("-") })
                        Button(action: capabilities.increment, label: { Text("+") })
                    }
                }
                .padding()
            }
        }

        class CounterViewModel: ViewProducing {
            typealias ComposedView = CounterView

            @Published private var count: Int = 0

            var content: Content {
                Content(
                    count: "\(count)"
                )
            }

            var capabilities: Capabilities {
                Capabilities(
                    increment: increment,
                    decrement: decrement
                )
            }

            private func increment() {
                count += 1
            }

            private func decrement() {
                count -= 1
            }
        }

        let counterViewModel = CounterViewModel()

        XCTAssertEqual(counterViewModel.content.count, "0")

        counterViewModel.capabilities.increment()

        XCTAssertEqual(counterViewModel.content.count, "1")

        counterViewModel.capabilities.decrement()
        counterViewModel.capabilities.decrement()

        XCTAssertEqual(counterViewModel.content.count, "-1")
    }
}
