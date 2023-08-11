//
import SwiftUI
import NavigationFlow

class FilterDetailFlow: Flow {

    private let name: String

    init(store: FlowStore, name: String) {
        self.name = name

        super.init(store: store)
    }

    override func view() -> AnyView {

        let viewModel = FilterDetailViewModel(navigation: navigation, name: name)

        return FilterDetailView(viewModel: viewModel)
            .inNavigation(with: navigation)
    }
}
