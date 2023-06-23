//
//  CatalogViewModel.swift
//  NavigationFlowExample
//
//  Created by Miroslav Beleš on 18.06.2023.
//

import Foundation
import NavigationFlow

class GalleryViewModel: ObservableObject {

    let navigation: Navigation<NoDestination>

    init(navigation: Navigation<NoDestination>) {
        self.navigation = navigation
    }

    func onPop() {
        // Pop action
    }

    func onPopToRoot() {
        // Pop to root action
    }
}
