//
import SwiftUI
import NavigationFlow

enum CatalogDestination {
    case productDetail(String)
    case filters
}

public struct CatalogFlow: Flow {


    private let onProductDetailFlow: (String) -> Flow
    private let onFilterFlow: () -> Flow

    public init(
        onProductDetailFlow: @escaping (String) -> Flow,
        onFilterFlow: @escaping () -> Flow
    ) {
        self.onProductDetailFlow = onProductDetailFlow
        self.onFilterFlow = onFilterFlow
    }

    @ViewBuilder
    public func view() -> AnyView {
        let navigation = Navigation<CatalogDestination> { destination in

            switch destination {
            case .productDetail(let name):
                return onProductDetailFlow(name).view()

            case .filters:
                return onFilterFlow().view()
            }
        }

        let viewModel = CatalogViewModel(navigation: navigation)

        CatalogView(viewModel: viewModel)
            .inRootNavigation(with: navigation)
    }
}
