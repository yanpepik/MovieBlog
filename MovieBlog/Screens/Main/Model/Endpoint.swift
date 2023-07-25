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
            "Authorization": GlobalConstants().authorizationKey
        ]
    }

    var parameters: [URLQueryItem]? {
        return [
            URLQueryItem(name: "api_key", value: "9b6f1a5c7d789ccc772f90ad774abe38")
        ]
    }
}
