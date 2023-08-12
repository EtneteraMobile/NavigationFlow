//

import Foundation


public class FlowStore {

    var flows: [Flow] = []

    var rootFlow: Flow? {
        flows.first
    }

    var parentFlow: Flow? {
        guard flows.count >= 2 else {
            return nil
        }

        return flows[flows.count - 2]
    }

    public init() {}

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
}
