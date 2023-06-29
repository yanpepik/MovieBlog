//
//  MainProtocols.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    func buttonIsPressed()
}

protocol MainBusinessLogic: AnyObject {}

protocol MainRoutingLogic: AnyObject {
    func routeToDetail()
}
