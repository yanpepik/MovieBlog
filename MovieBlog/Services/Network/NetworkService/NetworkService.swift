//
//  NetworkService.swift
//  MovieBlog
//
//  Created by Yan Pepik on 04/07/2023.
//

import Foundation
import SwiftUI

final class NetworkService: NetworkServiceProtocol {
    // MARK: - Methods
    func performRequest<BodyType: Encodable, ResponseType: Decodable>(
        request: Request<BodyType>
    ) async throws -> Response<ResponseType> {
        let urlRequest = try request.buildURLRequest()
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
                let decoder = JSONDecoder()
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
}
