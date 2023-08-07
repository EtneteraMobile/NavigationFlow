import SwiftUI

public extension View {

    func inNavigation(
        with navigation: Navigation
    ) -> AnyView {
        NavigationFlowView(navigation: navigation) {
            self
        }
        .toAnyView()
    }

    func inRootNavigation(
        with navigation: Navigation
    ) -> AnyView {
        RootNavigationFlowView(navigation: navigation) {
            self
        }
        .toAnyView()
    }
}

