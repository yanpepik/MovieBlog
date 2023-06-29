//
//  DetailRouter.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import UIKit

final class DetailRouter: DetailRoutingLogic {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - MainRoutingLogic
    func routeToMain() {
        navigationController.pushViewController(MainAssembly.assemble(navigationController: navigationController), animated: true)
    }
}
