import SwiftUI

public extension View {

    func inNavigation<Destination>(
        with navigation: Navigation<Destination>
    ) -> AnyView {
        NavigationFlowView(navigation: navigation) {
            self
        }
        .toAnyView()
    }

    func inRootNavigation<Destination>(
        with navigation: Navigation<Destination>
    ) -> AnyView {
        RootNavigationFlowView(navigation: navigation) {
            self
        }
        .toAnyView()
    }
}

