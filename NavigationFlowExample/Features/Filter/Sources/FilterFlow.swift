//
import SwiftUI
import NavigationFlow

//enum FilterDestination {
//    case filterDetail(String)
//}
//
//public struct FilterFlow: Flow {
//
//    public init() {}
//
//    @ViewBuilder
//    public func view() -> AnyView {
//        let navigation = Navigation<FilterDestination> { destination in
//            switch destination {
//            case .filterDetail(let name):
//                return FilterDetailFlow(name: name).view()
//            }
//        }
//
//        let viewModel = FilterViewModel(navigation: navigation)
//
//        FilterView(viewModel: viewModel)
//            .inRootNavigation(with: navigation)
//    }
//}
