//
//  MainViewModel.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import SwiftUI

final class MainViewModel: MainViewModelProtocol, ObservableObject {

    //MARK: - Properties
    private let interactor: MainBusinessLogic
    private let router: MainRoutingLogic

    //MARK: - Initialization
    init(interactor: MainBusinessLogic, router: MainRoutingLogic) {
        self.interactor = interactor
        self.router = router
    }

    func buttonIsPressed() {
        router.routeToDetail()
    }
}
