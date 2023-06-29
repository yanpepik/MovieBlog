//
//  MainRouter.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import UIKit

final class MainRouter: MainRoutingLogic {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - MainRoutingLogic
    func routeToDetail() {
        let detailViewController = DetailAssembly.assemble(navigationController: navigationController)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
