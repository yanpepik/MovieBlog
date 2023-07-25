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
    let body: BodyType?
    
    // MARK: - Initialization
    init(
        endpoint: EndpointProtocol,
        requestMethod: RequestMethod,
        body: BodyType? = nil
    ) {
        self.endpoint = endpoint
        self.requestMethod = requestMethod
        self.body = body
    }
}

extension Request where BodyType == Empty {
    init(
        endpoint: EndpointProtocol,
        requestMethod: RequestMethod
    ) {
        self.init(
            endpoint: endpoint,
            requestMethod: requestMethod,
            body: Empty()
        )
    }
}

struct Empty: Codable {}
