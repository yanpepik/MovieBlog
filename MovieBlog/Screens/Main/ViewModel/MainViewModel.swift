//
//  MainViewModel.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import SwiftUI

final class MainViewModel: ObservableObject, MainViewModelProtocol {
    //MARK: - Properties
    private let interactor: MainBusinessLogic
    private let delegate: MainScreenDelegate?
    @Published var mainItem: [MainItem]?

    //MARK: - Initialization
    init(interactor: MainBusinessLogic, delegate: MainScreenDelegate?) {
        self.delegate = delegate
        self.interactor = interactor
    }

    //MARK: - Methods
    func buttonPressed() {
        Task {
            do {
                let movies = try await interactor.fetchTrendingMovies()
                DispatchQueue.main.async {
                    self.mainItem = movies.map { movie in
                        MainItem(title: movie.title)
                    }
                    print(self.mainItem!)
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
