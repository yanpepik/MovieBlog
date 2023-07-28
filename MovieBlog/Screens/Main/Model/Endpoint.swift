//
//  Endpoint.swift
//  MovieBlog
//
//  Created by Yan Pepik on 10/07/2023.
//

import Foundation

enum Endpoint: EndpointProtocol {
    case trendingMovies

    var scheme: String { "https" }

    var host: String { "api.themoviedb.org" }

    var path: String {
        switch self {
        case .trendingMovies:
            return "/3/trending/movie/week"
        }
    }

    var headers: [String: String]? {
        [
            "accept": "application/json",
            "Authorization": NetworkConstants.authorizationKey
        ]
    }

    var parameters: [URLQueryItem]? {
        [
            URLQueryItem(name: "api_key", value: "9b6f1a5c7d789ccc772f90ad774abe38")
        ]
    }
}
