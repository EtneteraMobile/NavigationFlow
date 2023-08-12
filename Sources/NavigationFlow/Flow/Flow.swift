//
import SwiftUI
import Combine

open class Flow {

    public let store: FlowStore
    public let navigation = Navigation()
    private var cancellables = Set<AnyCancellable>()

    public init(store: FlowStore? = nil) {
        self.store = store ?? FlowStore()

        addSelfToStore()
        bindNavigationCallbacks()
    }

    open func view() -> AnyView {
        fatalError("Implement in Flow")
    }

    private func addSelfToStore() {
        store.add(self)
        printAllFlows()
    }

    private func bindNavigationCallbacks() {
        navigation.onPop = { [weak self] in
            self?.handlePop()
        }

        navigation.onPopToRoot = { [weak self] in
            self?.handlePopToRoot()
        }

        navigation
            .$isPushing
            .dropFirst()
            .sink { [weak self] isPushing in
            guard let self else { return }
            if isPushing == false {
                self.store.remove(after: self)
                printAllFlows()
            }
        }.store(in: &cancellables)
    }

    private func handlePop() {
        store.parentFlow?.navigation.isPushing = false
    }

    private func handlePopToRoot() {
        store.flows.reversed().forEach { flow in
            guard flow !== store.flows.last else {
                return
            }

            flow.navigation.isPushing = false
        }
    }

    private func printAllFlows() {
        print("==- ==============")
        store.flows.forEach {
            print("==- \($0)")
        }
        print("==- ==============")
    }
}
