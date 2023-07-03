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
        VStack {
            Text("MainView")
            Button("RouteToDetail") {
                viewModel.buttonPressed()
            }
        }
    }
}
