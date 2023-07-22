//
//  Response.swift
//  MovieBlog
//
//  Created by Yan Pepik on 04/07/2023.
//

import Foundation

struct Response<ResponseType: Decodable> {
    // MARK: - Public Properties
    let statusCode: Int
    let headers: [String: String]?
    let body: ResponseType?

    // MARK: - Initialization
    init(
        statusCode: Int,
        headers: [String: String]?,
        body: ResponseType?
    ) {
        self.statusCode = statusCode
        self.headers = headers
        self.body = body
    }
}
