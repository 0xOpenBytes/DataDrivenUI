import SwiftUI

public protocol ViewProducing: ObservableObject {
    associatedtype RootView: ComposedView
    
    typealias Content = RootView.Content
    typealias Capabilities = RootView.Capabilities
    
    var content: Content { get }
    var capabilities: Capabilities { get }
    
    var rootView: RootView { get }
}

extension ViewProducing {
    func view(content: Content, capabilities: Capabilities) -> RootView {
        RootView(content: content, capabilities: capabilities)
    }
    
    public var rootView: RootView {
        view(content: content, capabilities: capabilities)
    }
}
