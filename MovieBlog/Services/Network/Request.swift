//
//  Request.swift
//  MovieBlog
//
//  Created by Yan Pepik on 04/07/2023.
//

import Foundation

struct Request<BodyType: Encodable> {
    // MARK: - Properties
    let endpoint: EndpointProtocol
    let requestMethod: RequestMethod
    let parameters: [URLQueryItem]?
    let body: BodyType
    
    // MARK: - Initialization
    init(
        endpoint: EndpointProtocol,
        requestMethod: RequestMethod,
        parameters: [URLQueryItem]? = nil,
        body: BodyType
    ) {
        self.endpoint = endpoint
        self.requestMethod = requestMethod
        self.parameters = parameters
        self.body = body
    }
}

extension Request where BodyType == Empty {
    init(
        endpoint: EndpointProtocol,
        requestMethod: RequestMethod,
        parameters: [URLQueryItem]? = nil
    ) {
        self.init(
            endpoint: endpoint,
            requestMethod: requestMethod,
            parameters: parameters,
            body: Empty()
        )
    }
}

struct Empty: Codable {}
