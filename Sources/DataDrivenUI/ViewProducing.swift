import SwiftUI

public protocol ViewProducing: ObservableObject {
    associatedtype ComposedView: ComposableView

    typealias Content = ComposedView.Content
    typealias Capabilities = ComposedView.Capabilities

    var content: Content { get }
    var capabilities: Capabilities { get }

    var view: ComposedView { get }
}

extension ViewProducing {
    public var view: ComposedView {
        ComposedView(content: content, capabilities: capabilities)
    }
}
