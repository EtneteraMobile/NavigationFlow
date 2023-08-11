//
import SwiftUI
import NavigationFlow

enum FilterDestination: NavigationDestination {
    case filterDetail(String)
}

public class FilterFlow: Flow {

    override public func view() -> AnyView {

        navigation.createView { [weak self] (destination: FilterDestination) in
            guard let self else {
                return AnyView(EmptyView())
            }
            switch destination {
            case .filterDetail(let name):
                return FilterDetailFlow(store: self.store, name: name).view()
            }
        }

        let viewModel = FilterViewModel(navigation: navigation)

        return FilterView(viewModel: viewModel)
            .inNavigation(for: self)
    }
}
