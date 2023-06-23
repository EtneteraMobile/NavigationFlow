//
//  NavigationFlowExampleApp.swift
//  NavigationFlowExample
//
//  Created by Miroslav Beleš on 23.06.2023.
//

import SwiftUI
import App

@main
struct NavigationFlowExampleApp: App {
    var body: some Scene {
        WindowGroup {
            CatalogFlowFactory().view()
        }
    }
}
