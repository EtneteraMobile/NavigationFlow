//

import SwiftUI
import FilterFeature
import NavigationFlow

struct FilterFlowFactory {

    func flow(presentingStore: FlowStore?) -> Flow {
        FilterFlow(presentingStore: presentingStore)
    }
}
