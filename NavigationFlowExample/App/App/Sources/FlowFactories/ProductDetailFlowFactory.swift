//
import SwiftUI
import ProductDetailFeature
import NavigationFlow

struct ProductDetailFlowFactory {

    func flow(store: FlowStore, name: String) -> Flow {
        ProductDetailFlow(
            store: store,
            name: name,
            onGallery: {
                ProductDetailFlowFactory().flow(store: store, name: name)
            }
        )
    }
}
