//
//  MainViewModel.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import SwiftUI

final class MainViewModel: ObservableObject, MainViewModelProtocol {
    //MARK: - Properties
    @Published var mainItem: [MainItem] = []
    @Published var isShowingAlert = false
    @Published var alertMessage = ""

    //MARK: - Private Properties
    private let interactor: MainBusinessLogic
    private let delegate: MainScreenDelegate?


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
                    print(self.mainItem)
                }
            } catch let error {
                DispatchQueue.main.async {
                    self.alertMessage = error.localizedDescription
                    self.isShowingAlert = true
                }
            }
        }
    }
}
