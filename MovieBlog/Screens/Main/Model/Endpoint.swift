//
//  Endpoint.swift
//  MovieBlog
//
//  Created by Yan Pepik on 10/07/2023.
//

import Foundation

enum Endpoint: EndpointProtocol {
    case trendingMovies

    var scheme: String {
        return "https"
    }

    var host: String {
        return "api.themoviedb.org"
    }

    var path: String {
        switch self {
        case .trendingMovies:
            return "/3/trending/movie/week"
        }
    }

    var headers: [String: String]? {
        return [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjZmMWE1YzdkNzg5Y2NjNzcyZjkwYWQ3NzRhYmUzOCIsInN1YiI6IjY0YTQwNTU5ZDQwMGYzMDE0ZTk0YzQ1YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Azjvu504Yj9Y3Z7DQzcyEvYCviwAPOMPn682Ayi_hUU"
        ]
    }

    var parameters: [URLQueryItem]? {
        return [
            URLQueryItem(name: "api_key", value: "9b6f1a5c7d789ccc772f90ad774abe38")
        ]
    }
}
