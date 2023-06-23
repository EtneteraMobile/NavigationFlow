//

import SwiftUI
import GalleryFeature
import NavigationFlow

struct GalleryFlowFactory {

    func view() -> AnyView {
        GalleryFlow().view().toAnyView()
    }
}
