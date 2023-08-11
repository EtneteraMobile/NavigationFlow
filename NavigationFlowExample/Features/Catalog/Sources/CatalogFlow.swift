//
import SwiftUI
import NavigationFlow

enum CatalogDestination: NavigationDestination {
    case productDetail(String)
    case filters
}

public struct CatalogFlow: Flow {

    private let onProductDetailFlow: (String) -> Flow
    private let onFilterFlow: () -> Flow
    public let navigation: Navigation

    public init(
        store: NavigationStore,
        onProductDetailFlow: @escaping (String) -> Flow,
        onFilterFlow: @escaping () -> Flow
    ) {
        self.navigation = Navigation(store: store)
        self.onProductDetailFlow = onProductDetailFlow
        self.onFilterFlow = onFilterFlow
    }

    public func view() -> AnyView {

        navigation.createView { (destination: CatalogDestination) in
            switch destination {
            case .productDetail(let name):
                return onProductDetailFlow(name).view()

            case .filters:
                return onFilterFlow().view()
            }
        }

        let viewModel = CatalogViewModel(navigation: navigation)

        return CatalogView(viewModel: viewModel)
            .inRootNavigation(with: navigation)
    }
}
