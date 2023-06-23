//
import SwiftUI
import NavigationFlow

enum FilterDestination: Hashable, Identifiable {
    case filterDetail(String)

    var id: String {
        String(describing: self)
    }
}

public struct FilterFlow {

    public init() {}

    @ViewBuilder
    public func view() -> some View {
        let navigation = Navigation<FilterDestination> { destination in
            switch destination {
            case .filterDetail(let name):
                return FilterDetailFlow().view(name: name).toAnyView()
            }
        }

        let viewModel = FilterViewModel(navigation: navigation)

        FilterView(viewModel: viewModel)
            .inRootNavigationFlowView(with: navigation)
    }
}
