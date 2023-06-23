import SwiftUI

public struct RootNavigationFlowView<Content: View, Destination: Identifiable>: View {

    // MARK: - Properties

    @ObservedObject private var navigation: Navigation<Destination>
    private let content: () -> Content


    // MARK: - Initialization

    public init(navigation: Navigation<Destination>, @ViewBuilder content: @escaping () -> Content) {
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
