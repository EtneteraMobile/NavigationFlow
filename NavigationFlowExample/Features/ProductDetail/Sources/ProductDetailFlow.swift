//
//  ProductDetailFlow.swift
//  NavigationFlowExample
//
//  Created by Miroslav Beleš on 19.06.2023.
//

import SwiftUI
import NavigationFlow

enum ProductDetailDestination {
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

    @ViewBuilder
    public func view() -> AnyView {
        let navigation = Navigation<ProductDetailDestination> { destination in
            switch destination {
            case .gallery:
                return onGallery().view()
            }
        }

        let viewModel = ProductDetailViewModel(navigation: navigation, name: name)

        ProductDetailView(viewModel: viewModel)
            .inNavigation(with: navigation)
    }
}

