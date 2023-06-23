//
import SwiftUI
import NavigationFlow

enum FilterDestination: Identifiable {
    case filterDetail(String)

    var id: String {
        String(describing: self)
    }
}

public struct FilterFlow: Flow {

    public init() {}

    @ViewBuilder
    public func view() -> AnyView {
        let navigation = Navigation<FilterDestination> { destination in
            switch destination {
            case .filterDetail(let name):
                return FilterDetailFlow(name: name).view()
            }
        }

        let viewModel = FilterViewModel(navigation: navigation)

        FilterView(viewModel: viewModel)
            .inRootNavigation(with: navigation)
    }
}
