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

    @State var selectedTab = 0

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                CatalogFlowFactory().view(store: FlowStore(selectedTab: $selectedTab))
                    .tabItem {
                        Label("Catalog 1", systemImage: "book")
                    }
                    .tag(0)

                CatalogFlowFactory().view(store: FlowStore(selectedTab: $selectedTab))
                    .tabItem {
                        Label("Catalog 2", systemImage: "book")
                    }
                    .tag(1)

                CatalogFlowFactory().view(store: FlowStore(selectedTab: $selectedTab))
                    .tabItem {
                        Label("Catalog 3", systemImage: "book")
                    }
                    .tag(2)
            }
        }
    }
}
