//
import SwiftUI
import ProductDetailFeature
import NavigationFlow

struct ProductDetailFlowFactory {

    func flow(store: NavigationStore, name: String) -> Flow {
        ProductDetailFlow(
            store: store,
            name: name,
            onGallery: {
                ProductDetailFlowFactory().flow(store: store, name: name)
            }
        )
    }
}
