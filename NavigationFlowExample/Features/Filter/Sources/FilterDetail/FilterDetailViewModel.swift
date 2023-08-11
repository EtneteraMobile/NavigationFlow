//
//  CatalogViewModel.swift
//  NavigationFlowExample
//
//  Created by Miroslav Beleš on 18.06.2023.
//

import Foundation
import NavigationFlow

class FilterDetailViewModel: ObservableObject {

    let navigation: Navigation
    @Published var name: String

    init(navigation: Navigation, name: String) {
        self.name = name
        self.navigation = navigation
    }

    func onPop() {
        navigation.pop()
    }
}
