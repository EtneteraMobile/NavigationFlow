//

import SwiftUI
import GalleryFeature
import NavigationFlow

struct GalleryFlowFactory {

    func flow(store: FlowStore) -> Flow {
        GalleryFlow(store: store)
    }
}
