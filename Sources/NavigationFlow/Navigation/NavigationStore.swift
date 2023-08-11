//

import Foundation


public class FlowStore {

    var flows: [Flow] = []

    public init() {}

    func add(_ flow: Flow) {
        flows.append(flow)
    }

    var rootFlow: Flow? {
        flows.first
    }

    var parentFlow: Flow? {
        guard flows.count >= 2 else {
            return nil
        }

        return flows[flows.count - 2]
    }
}
