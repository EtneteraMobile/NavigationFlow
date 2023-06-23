//
import SwiftUI
import NavigationFlow

enum GalleryDestination: Hashable, Identifiable {
    case none

    var id: String {
        String(describing: self)
    }
}

public struct GalleryFlow {

    public init() {}

    @ViewBuilder
    public func view() -> some View {
        let navigation = Navigation<GalleryDestination>()

        let viewModel = GalleryViewModel(navigation: navigation)

        GalleryView(viewModel: viewModel)
            .inNavigationFlowView(with: navigation)
    }
}
