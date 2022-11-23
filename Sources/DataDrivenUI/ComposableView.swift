import SwiftUI

public protocol ComposableView: View {
    associatedtype Content
    associatedtype Capabilities

    var content: Content { get }
    var capabilities: Capabilities { get }

    init(content: Content, capabilities: Capabilities)
}
