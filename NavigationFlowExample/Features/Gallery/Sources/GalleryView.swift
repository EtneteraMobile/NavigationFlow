//
//  CatalogView.swift
//  NavigationFlowExample
//
//  Created by Miroslav Beleš on 18.06.2023.
//

import SwiftUI

struct GalleryView: View {

    @ObservedObject var viewModel: GalleryViewModel

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "shower.handheld.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 200)

            Button("Go back Product Detail") {
                viewModel.onPop()
            }
            .buttonStyle(.bordered)

            Button("Go back to Catalog") {
                viewModel.onPopToRoot()
            }
            .buttonStyle(.bordered)
        }
        .navigationTitle("Gallery")
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView(viewModel: .init(navigation: .init()))
    }
}
