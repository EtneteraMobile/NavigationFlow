//
import SwiftUI
import Combine

open class Flow {

    // MARK: - Properties

    public let store: FlowStore
    public let navigation = Navigation()
    private var cancellables = Set<AnyCancellable>()
    private let presentingStore: FlowStore?

    // MARK: - Initialization

    public init(store: FlowStore? = nil, presentingStore: FlowStore? = nil) {
        self.store = store ?? FlowStore()
        self.presentingStore = presentingStore

        addSelfToStore()
        bindNavigationCallbacks()
    }

    // MARK: - Open actions

    open func view() -> AnyView {
        fatalError("Implement in Flow")
    }

    // MARK: - Private actions

    private func addSelfToStore() {
        store.add(self)
        store.printAllFlows()
    }

    private func bindNavigationCallbacks() {
        navigation.onPop = { [weak self] last in
            self?.store.handlePop(last: last)
        }

        navigation.onPopToRoot = { [weak self] in
            self?.store.handlePopToRoot()
        }

        navigation.onDismiss = { [weak self] in
            self?.presentingStore?.handleDismiss()
        }

        navigation
            .$isPushing
            .dropFirst()
            .sink { [weak self] isPushing in
                guard let self else {
                    return
                }

                if isPushing == false {
                    self.store.remove(after: self)
                    store.printAllFlows()
                }
            }
            .store(in: &cancellables)
    }
}
