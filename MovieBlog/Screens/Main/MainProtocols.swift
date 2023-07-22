//
//  MainProtocols.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    var mainItem: [MainItem]? { get }
    func buttonPressed()
}

protocol MainBusinessLogic: AnyObject {
    func fetchTrendingMovies() async throws -> [MainModels.Movie]
}

protocol MainScreenDelegate {
    func mainWantsToShowDetails()
}
