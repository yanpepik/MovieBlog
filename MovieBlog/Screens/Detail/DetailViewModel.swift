//
//  DetailViewModel.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import SwiftUI

final class DetailViewModel: DetailViewModelProtocol, ObservableObject {
    //MARK: - Properties
    private let interactor: DetailBusinessLogic
    private let router: RoutingLogic

    //MARK: - Initialization
    init(interactor: DetailBusinessLogic, router: RoutingLogic) {
        self.interactor = interactor
        self.router = router
    }

    func buttonPressed() {
        router.routeToMain()
    }
}
