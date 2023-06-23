//
//  ProductDetailFlow.swift
//  NavigationFlowExample
//
//  Created by Miroslav Beleš on 19.06.2023.
//

import SwiftUI
import NavigationFlow

enum ProductDetailDestination: Hashable, Identifiable {
    case gallery

    var id: String {
        String(describing: self)
    }
}

public struct ProductDetailFlow {

    private let onGallery: () -> AnyView

    public init(onGallery: @escaping () -> AnyView) {
        self.onGallery = onGallery
    }

    @ViewBuilder
    public func view(name: String) -> some View {
        let navigation = Navigation<ProductDetailDestination> { destination in
            switch destination {
            case .gallery:
                return onGallery()
            }
        }

        let viewModel = ProductDetailViewModel(navigation: navigation, name: name)

        ProductDetailView(viewModel: viewModel)
            .inNavigationFlowView(with: navigation)
    }
}

