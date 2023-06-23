import SwiftUI

public class Navigation<Destination: Identifiable>: ObservableObject {

    // MARK: - Navigation Action

    public enum NavigationAction: Identifiable {
        case push(Destination)
        case sheet(Destination)
        case fullScreenCover(Destination)

        public var id: String {
            String(describing: self)
        }
    }


    // MARK: - Internal properties

    @Published var isPushing: Bool = false
    @Published var sheetNavigationAction: NavigationAction?
    @Published var fullScreenCoverNavigationAction: NavigationAction?


    // MARK: - Private properties

    private var pushingDestination: Destination?
    private let onCreateView: ((Destination) -> AnyView)?


    // MARK: - Initialization

    public init(onCreateView: ((Destination) -> AnyView)? = nil) {
        self.onCreateView = onCreateView
    }


    // MARK: - Public actions

    public func navigate(_ action: NavigationAction) {
        switch action {
        case .push(let destination):
            pushingDestination = destination
            isPushing = true
        case .sheet:
            sheetNavigationAction = action
        case .fullScreenCover:
            fullScreenCoverNavigationAction = action
        }
    }


    // MARK: - Internal actions

    func createPushView() -> AnyView {
        guard let destination = pushingDestination else {
            return EmptyView().toAnyView()
        }

        return onCreateView?(destination) ?? EmptyView().toAnyView()
    }

    func createView(_ navigationAction: Navigation<Destination>.NavigationAction) -> AnyView {
        switch navigationAction {
        case .sheet(let destination), .fullScreenCover(let destination):
            return onCreateView?(destination) ?? EmptyView().toAnyView()
        case .push:
            fatalError("\(#function) should not be used for pushing action!")
        }
    }
}
