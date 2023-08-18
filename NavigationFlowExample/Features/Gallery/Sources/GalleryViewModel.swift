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

    func onPopLastTwo() {
        navigation.pop(last: 2)
    }

    func onPopToRoot() {
        navigation.popToRoot()
    }

    func onSwitchTab(_ index: Int) {
        navigation.selectTab(index)
    }
}
