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

    @Published var isPushing: Bool = false
    @Published var sheetNavigationAction: NavigationAction?
    @Published var fullScreenCoverNavigationAction: NavigationAction?


    // MARK: - Private properties

//    private let store: NavigationStore
    private var destination: NavigationDestination?
    private var onCreateView: ((NavigationDestination) -> AnyView)?
    private var cancellables = Set<AnyCancellable>()


    // MARK: - Initialization

    public init(store: NavigationStore) {
        self.store = store

        setupStore()
    }


    // MARK: - Public actions

    public func navigate<Destination: NavigationDestination>(_ action: NavigationAction, for destination: Destination) {

        self.destination = destination

        switch action {
        case .push:
            isPushing = true
        case .sheet:
            sheetNavigationAction = action
        case .fullScreenCover:
            fullScreenCoverNavigationAction = action
        }
    }

    public func pop() {
        store.parent?.isPushing = false
//        store.removeNavigation()
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

    func createPushView() -> AnyView {
        guard let destination else {
            return EmptyView().toAnyView()
        }

        return onCreateView?(destination) ?? EmptyView().toAnyView()
    }

    func createView(_ navigationAction: Navigation.NavigationAction) -> AnyView {
        guard let destination else {
            return EmptyView().toAnyView()
        }

        switch navigationAction {
        case .sheet, .fullScreenCover:
            return onCreateView?(destination) ?? EmptyView().toAnyView()
        case .push:
            fatalError("\(#function) should not be used for pushing action!")
        }
    }

    // MARK: - Private actions

    private func setupStore() {
        $isPushing
            .dropFirst()
            .sink { [weak self] isPushing in
            guard let self else { return }
            if isPushing {
                self.store.add(self)
            } else {
                self.store.removeAfter(self)
            }
        }
        .store(in: &cancellables)
    }
}
