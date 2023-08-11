//
//  CatalogView.swift
//  NavigationFlowExample
//
//  Created by Miroslav Beleš on 18.06.2023.
//

import SwiftUI

struct CatalogView: View {

    @StateObject var viewModel: CatalogViewModel

    var body: some View {
        List(viewModel.items) { item in
            Button(item.name) {
                viewModel.onProductDetail(item.name)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: viewModel.onFilters) {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }
            }
        }
        .navigationTitle("Catalog")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView(viewModel: .init(navigation: .init(store: .init())))
    }
}
