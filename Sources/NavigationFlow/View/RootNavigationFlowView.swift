import SwiftUI

public struct RootNavigationFlowView<Content: View>: View {

    // MARK: - Properties

    @ObservedObject private var navigation: Navigation
    private let content: () -> Content


    // MARK: - Initialization

    public init(navigation: Navigation, @ViewBuilder content: @escaping () -> Content) {
        self.navigation = navigation
        self.content = content
    }


    // MARK: - Body

    public var body: some View {
        NavigationStack {
            NavigationFlowView(navigation: navigation, content: content)
        }
    }
}
