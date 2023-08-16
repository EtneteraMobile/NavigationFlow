import SwiftUI
import Combine

public protocol NavigationDestination {}

public class Navigation: ObservableObject {

    // MARK: - Navigation Action

    public enum NavigationAction: Identifiable {
        case push
        case sheet
        case fullScreenCover

        public var id: String {
            String(describing: self)
        }
    }


    // MARK: - Internal properties

    @Published var isPushing = false
    @Published var isPresentingSheet = false
    @Published var isPresentingFullScreenCover = false
    var onPop: (() -> Void)?
    var onPopToRoot: (() -> Void)?
    var onDismiss: (() -> Void)?

    // MARK: - Private properties

    private var destination: NavigationDestination?
    private var onCreateView: ((NavigationDestination) -> AnyView)?
    private var cancellables = Set<AnyCancellable>()


    // MARK: - Initialization

    public init() {}


    // MARK: - Public actions

    public func navigate<Destination: NavigationDestination>(_ action: NavigationAction, for destination: Destination) {

        self.destination = destination

        switch action {
        case .push:
            isPushing = true
        case .sheet:
            isPresentingSheet = true
        case .fullScreenCover:
            isPresentingFullScreenCover = true
        }
    }

    public func popToRoot() {
        onPopToRoot?()
    }
    
    public func pop() {
        onPop?()
    }

    public func dismiss() {
        onDismiss?()
    }

    public func createView<Destination: NavigationDestination>(_ onDestination: @escaping (Destination) -> AnyView?) {
        onCreateView = { destination in
            guard let flowDestination = destination as? Destination else {
                return EmptyView().toAnyView()
            }

            return onDestination(flowDestination) ?? EmptyView().toAnyView()
        }
    }


    // MARK: - Internal actions

    func createView() -> AnyView {
        guard let destination, (isPushing || isPresentingSheet || isPresentingFullScreenCover) else {
            return EmptyView().toAnyView()
        }

        return onCreateView?(destination) ?? EmptyView().toAnyView()
    }
}
