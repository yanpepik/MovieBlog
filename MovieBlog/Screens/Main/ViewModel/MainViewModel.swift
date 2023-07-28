//
//  MainViewModel.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import SwiftUI

final class MainViewModel: ObservableObject, MainViewModelProtocol {
    private let interactor: MainBusinessLogic
    private let delegate: MainScreenDelegate?

    @Published var data: Data = Data(items: [], state: .initial)

    init(interactor: MainBusinessLogic, delegate: MainScreenDelegate?) {
        self.delegate = delegate
        self.interactor = interactor
    }

    func dismissButtonPressed() {
        data = Data(items: data.items, state: .loaded)
    }

    @MainActor
    func fetchTrendingMovies() async {
        data = Data(items: [], state: .loading)
        await loadData()
    }

    @MainActor
    func refresh() async {
        data = Data(items: data.items, state: .loading)
        await loadData()
    }

    @MainActor
    private func loadData() async {
        do {
            let movies = try await interactor.fetchTrendingMovies()
            let updatedItems = movies.map { Item(title: $0.title) }
            data = Data(items: updatedItems, state: .loaded)
        } catch {
            data = Data(items: data.items, state: .error(message: "Failed to load trending movies. Please try again"))
        }
    }
}
