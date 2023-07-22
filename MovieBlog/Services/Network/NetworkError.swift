//
//  NetworkError.swift
//  MovieBlog
//
//  Created by Yan Pepik on 05/07/2023.
//

import Foundation

enum ErrorType: String, Decodable {
    case urlBuilding
    case decoding
    case encoding
    case redirection
    case undefined
    case timeout
}

struct NetworkError: Error, Decodable {
    // MARK: - Public Properties
    var statusCode: Int
    let errorType: ErrorType
    let message: String?
    let headers: [String: String]?
    let rawData: Data?

    // MARK: - Initialization
    init(
        errorType: ErrorType = .undefined,
        message: String? = nil,
        headers: [String: String]? = nil,
        statusCode: Int = 0,
        rawData: Data? = nil
    ) {
        self.statusCode = statusCode
        self.errorType = errorType
        self.message = message
        self.headers = headers
        self.rawData = rawData
    }
}
