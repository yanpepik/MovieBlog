//
//  DetailProtocols.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    func buttonPressed()
}

protocol DetailBusinessLogic: AnyObject {}

protocol DetailRoutingLogic: AnyObject {
    func routeToMain()
}
