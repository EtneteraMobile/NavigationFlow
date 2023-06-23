//
import SwiftUI
import NavigationFlow

enum CatalogDestination: Hashable, Identifiable {
    case productDetail(String)
    case filters

    var id: String {
        String(describing: self)
    }
}

public struct CatalogFlow {


    private let onProductDetailView: (String) -> AnyView
    private let onFilterView: () -> AnyView

    public init(
        onProductDetailView: @escaping (String) -> AnyView,
        onFilterView: @escaping () -> AnyView
    ) {
        self.onProductDetailView = onProductDetailView
        self.onFilterView = onFilterView
    }

    @ViewBuilder
    public func view() -> some View {
        let navigation = Navigation<CatalogDestination> { destination in

            switch destination {
            case .productDetail(let name):
                return onProductDetailView(name)

            case .filters:
                return onFilterView()
            }
        }

        let viewModel = CatalogViewModel(navigation: navigation)

        CatalogView(viewModel: viewModel)
            .inRootNavigationFlowView(with: navigation)
    }
}
