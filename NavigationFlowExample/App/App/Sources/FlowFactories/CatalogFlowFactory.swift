//
import SwiftUI
import CatalogFeature
import NavigationFlow

public struct CatalogFlowFactory {

    public init() {}

    public func view(store: FlowStore) -> some View {
        CatalogFlow(
            store: store,
            onProductDetailFlow: { name in
                ProductDetailFlowFactory().flow(store: store, name: name)
            },
            onFilterFlow: {
                FilterFlowFactory().flow(presentingStore: store)
            }
        )
        .view()
    }
}
