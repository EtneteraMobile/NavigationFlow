//
import SwiftUI
import NavigationFlow

enum FilterDetailDestination: Hashable, Identifiable {
    case none

    var id: String {
        String(describing: self)
    }
}

class FilterDetailFlow {

    @ViewBuilder
    func view(name: String) -> some View {
        let navigation = Navigation<FilterDetailDestination>()

        let viewModel = FilterDetailViewModel(navigation: navigation, name: name)

        FilterDetailView(viewModel: viewModel)
            .inNavigationFlowView(with: navigation)
    }
}
