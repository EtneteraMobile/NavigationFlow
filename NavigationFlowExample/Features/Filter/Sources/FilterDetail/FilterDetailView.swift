//
import SwiftUI
import NavigationFlow

struct FilterDetailView: View {

    @ObservedObject var viewModel: FilterDetailViewModel

    var body: some View {
        VStack {
            Button("Pop") {
                viewModel.onPop()
            }
        }
        .navigationTitle(viewModel.name)
    }
}

struct FilterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilterDetailView(viewModel: .init(navigation: .init(), name: ""))
    }
}
