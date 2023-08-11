//
import SwiftUI
import NavigationFlow

enum CatalogDestination: NavigationDestination {
    case productDetail(String)
    case filters
}

public class CatalogFlow: Flow {

    private let onProductDetailFlow: (String) -> Flow
    private let onFilterFlow: () -> Flow

    public init(
        store: FlowStore?,
        onProductDetailFlow: @escaping (String) -> Flow,
        onFilterFlow: @escaping () -> Flow
    ) {
        self.onProductDetailFlow = onProductDetailFlow
        self.onFilterFlow = onFilterFlow
        super.init(store: store)
    }

    override public func view() -> AnyView {

        navigation.createView { [weak self] (destination: CatalogDestination) in
            guard let self else { return AnyView(EmptyView()) }

            switch destination {
            case .productDetail(let name):
                return self.onProductDetailFlow(name).view()

            case .filters:
                return self.onFilterFlow().view()
            }
        }

        let viewModel = CatalogViewModel(navigation: navigation)

        return CatalogView(viewModel: viewModel)
            .inNavigation(for: self)
    }
}
