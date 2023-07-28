//
//  MainBusinessLogic.swift
//  MovieBlog
//
//  Created by Yan Pepik on 31/07/2023.
//

import Foundation
import SwiftUI

protocol MainBusinessLogic {
    func fetchTrendingMovies() async throws -> [MainMovies]
}
