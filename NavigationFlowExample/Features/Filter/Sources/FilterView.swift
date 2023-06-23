//
import SwiftUI
import NavigationFlow

struct FilterView: View {

    @StateObject var viewModel: FilterViewModel

    var body: some View {
        List(viewModel.filters) { item in
            Button(item.name) {
                viewModel.onFilterDetail(for: item.name)
            }
        }
        .navigationTitle("Filters")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(viewModel: .init(navigation: .init()))
    }
}
