//
import SwiftUI
import ProductDetailFeature
import NavigationFlow

struct ProductDetailFlowFactory {

    func view(name: String) -> AnyView {
        ProductDetailFlow(
            onGallery: {
                GalleryFlowFactory().view()
            }
        )
        .view(name: name)
        .toAnyView()
    }
}
