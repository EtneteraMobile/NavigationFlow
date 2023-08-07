//
//  ProductDetailFlow.swift
//  NavigationFlowExample
//
//  Created by Miroslav Beleš on 19.06.2023.
//

import SwiftUI
import NavigationFlow

enum ProductDetailDestination: NavigationDestination {
    case gallery
}

public struct ProductDetailFlow: Flow {

    private let name: String
    private let onGallery: () -> Flow

    public init(
        name: String,
        onGallery: @escaping () -> Flow
    ) {
        self.name = name
        self.onGallery = onGallery
    }

    public func view() -> AnyView {
        let navigation = Navigation()

        navigation.createView { (destination: ProductDetailDestination) in
            switch destination {
            case .gallery:
                return onGallery().view()
            }
        }

        let viewModel = ProductDetailViewModel(navigation: navigation, name: name)

        return ProductDetailView(viewModel: viewModel)
            .inNavigation(with: navigation)
    }
}

