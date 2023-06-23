//
import NavigationFlow
import Foundation

struct FilterEntity: Identifiable {
    let name: String

    var id: String {
        name
    }
}

class FilterViewModel: ObservableObject {

    @Published var filters: [FilterEntity] = [
        .init(name: "Filter #1"),
        .init(name: "Filter #2"),
        .init(name: "Filter #3"),
        .init(name: "Filter #4"),
        .init(name: "Filter #5"),
    ]

    let navigation: Navigation<FilterDestination>

    init(navigation: Navigation<FilterDestination>) {
        self.navigation = navigation
    }

    func onFilterDetail(for name: String) {
        navigation.navigate(.push(.filterDetail(name)))
    }
}
