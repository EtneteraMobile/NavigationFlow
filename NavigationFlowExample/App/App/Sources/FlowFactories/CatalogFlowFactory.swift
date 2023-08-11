//
import SwiftUI
import CatalogFeature
import NavigationFlow

public struct CatalogFlowFactory {

    public init() {}

    public func view() -> some View {
        let store = NavigationStore()

        return CatalogFlow(
            store: store,
            onProductDetailFlow: { name in
                ProductDetailFlowFactory().flow(store: store, name: name)
            },
            onFilterFlow: {
                ProductDetailFlowFactory().flow(store: store, name: "name")
            }
        )
        .view()
    }
}
