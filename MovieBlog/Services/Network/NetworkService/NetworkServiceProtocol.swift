//
//  NetworkServiceProtocol.swift
//  MovieBlog
//
//  Created by Yan Pepik on 25/07/2023.
//

protocol NetworkServiceProtocol {
    func performRequest<BodyType: Encodable, ResponseType: Decodable>(request: Request<BodyType>) async throws -> Response<ResponseType>
}
