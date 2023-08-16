//

import Foundation


public class FlowStore {

    // MARK: - Properties

    private var flows: [Flow] = []
    var rootFlow: Flow? {
        flows.first
    }
    var parentFlow: Flow? {
        guard flows.count >= 2 else {
            return nil
        }

        return flows[flows.count - 2]
    }
    var lastFlow: Flow? {
        flows.last
    }

    // MARK: - Initialization

    public init() {}

    // MARK: - Actions

    func add(_ flow: Flow) {
        flows.append(flow)
    }

    func remove(after flow: Flow) {
        guard
            let index = flows.firstIndex(where: { $0 === flow }),
            flows.count > index + 1
        else {
            return
        }
        flows.remove(at: index + 1)
    }

    func handlePopToRoot() {
        flows.reversed().forEach { flow in
            guard flow !== flows.last else {
                return
            }

            flow.navigation.isPushing = false
        }
    }

    func handlePop(last: Int) {
        guard flows.count >= last else {
            return
        }
        flows.reversed().enumerated().forEach { flow in
            guard flow.offset <= last else {
                return
            }

            flow.element.navigation.isPushing = false
        }
    }

    func handleDismiss() {
        lastFlow?.navigation.isPresentingSheet = false
        lastFlow?.navigation.isPresentingFullScreenCover = false
    }

    func printAllFlows() {
        print("==- ==============")
        flows.forEach {
            print("==- \($0)")
        }
        print("==- ==============")
    }
}
