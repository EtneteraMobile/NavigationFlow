//
import SwiftUI
import ProductDetailFeature
import NavigationFlow

struct ProductDetailFlowFactory {

    func flow(name: String) -> Flow {
        ProductDetailFlow(
            name: name,
            onGallery: {
                ProductDetailFlowFactory().flow(name: name)
            }
        )
    }
}
