//
//  NetworkService.swift
//  MovieBlog
//
//  Created by Yan Pepik on 04/07/2023.
//

import Foundation
import SwiftUI

final class NetworkService {
    // MARK: - Public Properties
    static let shared = NetworkService()

    // MARK: - Private Properties
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()

    // MARK: - Initialization
    private init() {}

    // MARK: - Public Methods
    func performRequest<BodyType: Encodable, ResponseType: Decodable>(
        request: Request<BodyType>
    ) async throws -> Response<ResponseType> {
        guard let url = buildURL(with: request) else {
            throw NetworkError(
                errorType: .urlBuilding,
                message: "Failed to build URL"
            )
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.requestMethod.rawValue

        if request.requestMethod != .GET {
            do {
                let encodedBody = try encoder.encode(request.body)
                urlRequest.httpBody = encodedBody
            } catch {
                throw NetworkError(
                    errorType: .encoding,
                    message: "Failed to encode data, check body that you provided"
                )
            }
        }

        if let headers = request.endpoint.headers {
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }

        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)

            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                throw NetworkError(
                    errorType: .undefined,
                    message: "Unknown error"
                )
            }

            let headers = httpResponse.allHeaderFields as? [String: String]

            switch httpResponse.statusCode {
            case 200...299:
                let decodedBody = try decoder.decode(ResponseType.self, from: data)
                let response = Response(statusCode: httpResponse.statusCode, headers: headers, body: decodedBody)
                return response

            case 300...399:
                throw NetworkError(
                    errorType: .redirection,
                    headers: headers,
                    statusCode: httpResponse.statusCode,
                    rawData: data
                )

            default:
                throw NetworkError(
                    headers: headers,
                    statusCode: httpResponse.statusCode,
                    rawData: data
                )
            }

        } catch let error as NSError {
            if error.code == NSURLErrorTimedOut {
                throw NetworkError(
                    errorType: .timeout,
                    message: error.localizedDescription
                )
            } else {
                throw NetworkError(
                    message: error.localizedDescription,
                    statusCode: error.code
                )
            }
        }
    }

    // MARK: - Private Methods
    private func buildURL<BodyType: Encodable>(with request: Request<BodyType>) -> URL? {
        var components = URLComponents()
        components.scheme = request.endpoint.scheme
        components.percentEncodedHost = request.endpoint.host
        components.path = request.endpoint.path
        components.queryItems = request.parameters

        return components.url
    }
}
