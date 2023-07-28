//
//  MainItems.swift
//  MovieBlog
//
//  Created by Yan Pepik on 03/08/2023.
//

import Foundation

struct Item: Identifiable, Equatable {
    let id = UUID()
    let title: String
}
