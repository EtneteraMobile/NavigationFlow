//
//  ProductDetailViewModel.swift
//  NavigationFlowExample
//
//  Created by Miroslav Beleš on 19.06.2023.
//

import SwiftUI
import NavigationFlow

class ProductDetailViewModel: ObservableObject {

    let navigation: Navigation

    @Published var name: String

    init(navigation: Navigation, name: String) {
        self.navigation = navigation
        self.name = name
    }

    func onGallery() {
        navigation.navigate(.push, for: ProductDetailDestination.gallery)
    }

    func onPopToRoot() {
        navigation.popToRoot()
    }

    func onPop() {
        navigation.pop()
    }
}
