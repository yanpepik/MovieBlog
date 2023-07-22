//
//  MainInteractor.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import Foundation

final class MainInteractor: MainBusinessLogic {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchTrendingMovies() async throws -> [MainModels.Movie] {
        let request = Request(endpoint: Endpoint.trendingMovies, requestMethod: .GET)
        do {
            let response: Response<MovieSearchResponse> = try await networkService.performRequest(request: request)
            return response.body?.results ?? []
        } catch {
            throw error
        }
    }
}
