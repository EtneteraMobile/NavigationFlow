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

public class ProductDetailFlow: Flow {

    private let name: String
    private let onGallery: () -> Flow

    public init(
        store: FlowStore?,
        name: String,
        onGallery: @escaping () -> Flow
    ) {
        self.name = name
        self.onGallery = onGallery
        super.init(store: store)
    }

    override public func view() -> AnyView {

        navigation.createView { [weak self] (destination: ProductDetailDestination) in
            guard let self else { return AnyView(EmptyView()) }
            switch destination {
            case .gallery:
                return self.onGallery().view()
            }
        }

        let viewModel = ProductDetailViewModel(navigation: navigation, name: name)

        return ProductDetailView(viewModel: viewModel)
            .inNavigation(for: self)
    }
}

