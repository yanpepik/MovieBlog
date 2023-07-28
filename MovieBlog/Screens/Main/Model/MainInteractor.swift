//
//  MainInteractor.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

final class MainInteractor: MainBusinessLogic {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func fetchTrendingMovies() async throws -> [MainMovies] {
        let request = Request(endpoint: Endpoint.trendingMovies, method: .GET)
        let response: Response<MovieSearchResponseDto> = try await networkService.performRequest(request: request)

        let model = response.body.results.map { trendingMovie in
            MainMovies(id: trendingMovie.id, title: trendingMovie.title)
        }

        return model
    }
}
