import SwiftUI

struct NavigationFlowView<Content: View>: View {

    // MARK: - Properties

    @ObservedObject var navigation: Navigation
    let content: () -> Content


    // MARK: - Body

    var body: some View {
        content()
            .navigationDestination(isPresented: $navigation.isPushing, destination: navigation.createView)
            .sheet(isPresented: $navigation.isPresentingSheet, content: navigation.createView)
            .fullScreenCover(isPresented: $navigation.isPresentingFullScreenCover, content: navigation.createView)
    }
}
