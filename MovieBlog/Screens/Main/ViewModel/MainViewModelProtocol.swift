//
//  MainViewModelProtocol.swift
//  MovieBlog
//
//  Created by Yan Pepik on 31/07/2023.
//

import Foundation
import SwiftUI

protocol MainViewModelProtocol: AnyObject {
    var data: MainViewModel.Data { get set }
    func fetchTrendingMovies() async
    func refresh() async
    func dismissButtonPressed()
}
