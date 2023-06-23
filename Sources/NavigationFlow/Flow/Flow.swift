//
import SwiftUI

public protocol Flow {

    associatedtype RootView: View
    associatedtype Input

    @ViewBuilder
    func view(input: Input?) -> RootView

    @ViewBuilder
    func view() -> RootView
}

struct EmptyInput {}

public extension Flow {
    @ViewBuilder
    func view(input: Input? = nil) -> RootView {
        view(input: input)
    }

    @ViewBuilder
    func view() -> RootView {
        let emptyInput: Input? = nil
        view(input: emptyInput)
    }
}
