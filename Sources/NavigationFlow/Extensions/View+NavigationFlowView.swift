import SwiftUI

public extension View {
    func inNavigation(for flow: Flow) -> AnyView {
        flow.store.parentFlow == nil
            ? RootNavigationFlowView(navigation: flow.navigation) { self }.toAnyView()
            : NavigationFlowView(navigation: flow.navigation) { self }.toAnyView()
    }
}

