//
import SwiftUI
import CatalogFeature
import NavigationFlow

public struct CatalogFlowFactory {

    public init() {}

    public func view() -> AnyView {
        CatalogFlow(
            onProductDetailView: { name in
                ProductDetailFlowFactory().view(name: name)
            },
            onFilterView: {
                FilterFlowFactory().view()
            }
        )
        .view()
        .toAnyView()
    }
}
