//
//  EndpointProtocol.swift
//  MovieBlog
//
//  Created by Yan Pepik on 04/07/2023.
//

protocol EndpointProtocol {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var headers: [String: String]? { get }
}
