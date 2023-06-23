import SwiftUI

public extension View {

    func inNavigationFlowView<Destination: Hashable & Identifiable>(with navigation: Navigation<Destination>) -> some View {
        NavigationFlowView(navigation: navigation) {
            self
        }
    }

    func inRootNavigationFlowView<Destination: Hashable & Identifiable>(with navigation: Navigation<Destination>) -> some View {
        RootNavigationFlowView(navigation: navigation) {
            self
        }
    }
}

