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
    let method: RequestMethod
    let body: BodyType?
    
    // MARK: - Initialization
    init(
        endpoint: EndpointProtocol,
        method: RequestMethod,
        body: BodyType? = nil
    ) {
        self.endpoint = endpoint
        self.method = method
        self.body = body
    }
}

extension Request where BodyType == Empty {
    init(
        endpoint: EndpointProtocol,
        method: RequestMethod
    ) {
        self.init(
            endpoint: endpoint,
            method: method,
            body: Empty()
        )
    }
}

extension Request {
    func buildURLRequest() throws -> URLRequest {
        guard let url = buildURL(with: endpoint) else { throw NetworkError(errorType: .urlBuilding) }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        switch method {
        case .PUT, .POST:
            do {
                let encoder = JSONEncoder()
                let encodedBody = try encoder.encode(body)
                urlRequest.httpBody = encodedBody
            } catch {
                throw NetworkError(
                    errorType: .encoding,
                    message: "Failed to encode data, check body that you provided"
                )
            }
        default:
            break
        }

        if let headers = endpoint.headers {
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }

        return urlRequest
    }

    private func buildURL(with endpoint: EndpointProtocol) -> URL? {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.percentEncodedHost = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.parameters

        return components.url
    }
}

struct Empty: Codable {}
