import SwiftUI

public struct NavigationFlowView<Content: View, Destination>: View {

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
        content()
            .navigationDestination(isPresented: $navigation.isPushing, destination: navigation.createPushView)
            .sheet(item: $navigation.sheetNavigationAction, content: navigation.createView)
            .fullScreenCover(item: $navigation.fullScreenCoverNavigationAction, content: navigation.createView)
    }
}
