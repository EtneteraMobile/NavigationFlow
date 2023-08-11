//
import SwiftUI
import NavigationFlow

public class GalleryFlow: Flow {

    override public func view() -> AnyView {

        let viewModel = GalleryViewModel(navigation: navigation)

        return GalleryView(viewModel: viewModel)
            .inNavigation(for: self)
    }
}
