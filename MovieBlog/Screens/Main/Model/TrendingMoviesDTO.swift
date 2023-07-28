//
//  TrendingMoviesDTO.swift
//  MovieBlog
//
//  Created by Yan Pepik on 27/07/2023.
//

import Foundation

struct MovieSearchResponseDto: Decodable {
    let results: [TrendingMovieDto]
}

struct TrendingMovieDto: Decodable {
    let id: Int
    let title: String
}
