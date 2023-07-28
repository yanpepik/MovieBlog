//
//  MainView.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import SwiftUI

struct MainView<ViewModel: MainViewModelProtocol & ObservableObject>: View {
    //MARK: - Properties
    @StateObject private var viewModel: ViewModel

    //MARK: - Initialization
    init(viewModel: @escaping @autoclosure () -> ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }

    //MARK: - Body
    var body: some View {
        List {
            content()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .alert(isPresented: $viewModel.data.state.isFailed) {
                    Alert(
                        title: Text("Error"),
                        message: Text(viewModel.data.state.errorMessage),
                        dismissButton: .default(Text("OK")) {
                            viewModel.dismissButtonPressed()
                        }
                    )
                }
        }
        .task {
            await viewModel.fetchTrendingMovies()
        }
        .refreshable {
            await viewModel.refresh()
        }
    }

    @ViewBuilder
    private func content() -> some View {
        switch viewModel.data.state {
        case .loaded, .error, .loading:
            if !viewModel.data.items.isEmpty {
                ForEach(viewModel.data.items, id: \.id) { item in
                    Text(item.title)
                }
            } else {
                Text("No movies")
            }
        default:
            EmptyView()
        }
    }
}
