//
import SwiftUI
import CatalogFeature
import NavigationFlow

public struct CatalogFlowFactory {

    public init() {}

    public func view() -> some View {
        CatalogFlow(
            onProductDetailFlow: { name in
                ProductDetailFlowFactory().flow(name: name)
            },
            onFilterFlow: {
                FilterFlowFactory().flow()
            }
        )
        .view()
    }
}
