//
//  MainProtocols.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    func buttonPressed()
}

protocol MainBusinessLogic: AnyObject {}

protocol MainScreenDelegate {
    func  mainWantsToShowDetails()
}
