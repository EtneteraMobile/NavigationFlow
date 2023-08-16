//
import SwiftUI
import NavigationFlow

struct FilterView: View {

    @ObservedObject var viewModel: FilterViewModel

    var body: some View {
        List(viewModel.filters) { item in
            Button(item.name) {
                viewModel.onFilterDetail(for: item.name)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.onDismiss()
                } label: {
                    Image(systemName: "x.circle")
                }

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
