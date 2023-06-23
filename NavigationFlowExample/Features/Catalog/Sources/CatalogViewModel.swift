//
import Foundation
import NavigationFlow

struct CatalogItem: Identifiable {
    let name: String

    var id: String {
        name
    }
}

class CatalogViewModel: ObservableObject {

    let navigation: Navigation<CatalogDestination>

    @Published var items: [CatalogItem] = [
        .init(name: "Item #1"),
        .init(name: "Item #2"),
        .init(name: "Item #3"),
        .init(name: "Item #4"),
        .init(name: "Item #5"),
        .init(name: "Item #6"),
        .init(name: "Item #7"),
        .init(name: "Item #8"),
        .init(name: "Item #9"),
        .init(name: "Item #10"),
        .init(name: "Item #11"),
        .init(name: "Item #12")
    ]


    init(navigation: Navigation<CatalogDestination>) {
        self.navigation = navigation
    }

    func onProductDetail(_ name: String) {
        navigation.navigate(.push(.productDetail(name)))
    }

    func onFilters() {
        navigation.navigate(.sheet(.filters))
    }
}
