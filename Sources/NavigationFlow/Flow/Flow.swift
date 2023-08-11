//
import SwiftUI

open class Flow {

    public let store: FlowStore
    public let navigation = Navigation()

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
        print("==- Added new flow! Current count \(store.flows.count)")
        printAllFlows()
    }

    private func bindNavigationCallbacks() {
        navigation.onPop = { [weak self] in
            self?.handlePop()
        }

        navigation.onPopToRoot = { [weak self] in
            self?.handlePopToRoot()
        }
    }

    private func handlePop() {
        print("==- Poping to parent... Parent is \(store.parentFlow)")
        store.parentFlow?.navigation.isPushing = false

        guard store.flows.count >= 2 else {
            return
        }

        print("==- Removing last flow...")
        store.flows.removeLast()

        print("==- Flow count after poping \(store.flows.count)")
        printAllFlows()
    }

    private func handlePopToRoot() {
        print("==- Poping to root. Root is \(store.rootFlow)...")
        store.rootFlow?.navigation.isPushing = false
        let rangeToRemove = 1...store.flows.count - 1

        print("==- Removing flows \(rangeToRemove)...")
        store.flows.removeSubrange(rangeToRemove)

        print("==- Flow count after pop to root \(store.flows.count)")
        printAllFlows()
    }

    private func printAllFlows() {
        print("==- ==============")
        store.flows.forEach {
            print("==- \($0)")
        }
        print("==- ==============")
    }
}
