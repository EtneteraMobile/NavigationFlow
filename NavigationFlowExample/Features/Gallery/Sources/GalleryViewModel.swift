//
//  CatalogViewModel.swift
//  NavigationFlowExample
//
//  Created by Miroslav Beleš on 18.06.2023.
//

import Foundation
import NavigationFlow

class GalleryViewModel: ObservableObject {

    let navigation: Navigation

    init(navigation: Navigation) {
        self.navigation = navigation
    }

    func onPop() {
        navigation.pop()
    }

    func onPopToRoot() {
        navigation.popToRoot()
    }
}
