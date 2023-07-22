//
//  MainModels.swift
//  MovieBlog
//
//  Created by Yan Pepik on 10/07/2023.
//

import Foundation

enum MainModels {
    struct Movie: Codable {
        let id: Int
        let title: String
        let overview: String
    }
}
