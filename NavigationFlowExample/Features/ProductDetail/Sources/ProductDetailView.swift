//
//  ProductDetailView.swift
//  NavigationFlowExample
//
//  Created by Miroslav Beleš on 19.06.2023.
//

import SwiftUI

struct ProductDetailView: View {

    @StateObject var viewModel: ProductDetailViewModel

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "shower.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 200)

            Text("Product Detail of \(viewModel.name)")

            Button("Go to gallery") {
                viewModel.onGallery()
            }
            .buttonStyle(.bordered)
        }
        .navigationTitle("Product detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: .init(navigation: .init(), name: ""))
    }
}
