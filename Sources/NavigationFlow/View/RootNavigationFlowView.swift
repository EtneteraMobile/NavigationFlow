import SwiftUI

struct RootNavigationFlowView<Content: View>: View {

    // MARK: - Properties

    @ObservedObject var navigation: Navigation
    let content: () -> Content


    // MARK: - Body

    var body: some View {
        NavigationStack {
            NavigationFlowView(navigation: navigation, content: content)
        }
    }
}
