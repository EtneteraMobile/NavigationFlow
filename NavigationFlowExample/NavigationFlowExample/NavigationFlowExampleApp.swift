//
//  NavigationFlowExampleApp.swift
//  NavigationFlowExample
//
//  Created by Miroslav Beleš on 23.06.2023.
//

import SwiftUI
import App
import NavigationFlow

@main
struct NavigationFlowExampleApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                CatalogFlowFactory().view(store: FlowStore())
                    .tabItem {
                        Label("Catalog 1", systemImage: "book")
                    }

                CatalogFlowFactory().view(store: FlowStore())
                    .tabItem {
                        Label("Catalog 2", systemImage: "book")
                    }

                CatalogFlowFactory().view(store: FlowStore())
                    .tabItem {
                        Label("Catalog 3", systemImage: "book")
                    }
            }
        }
    }
}
