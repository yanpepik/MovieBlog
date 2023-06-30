//
//  Router.swift
//  MovieBlog
//
//  Created by Yan Pepik on 30/06/2023.
//

import UIKit

protocol RoutingLogic: AnyObject {
    func root() -> UIViewController
    func routeToDetail()
    func routeToMain()
}

final class Router: RoutingLogic {
    //MARK: - Properties
    let navigationController = UINavigationController()
    let assembly: AssemblyLogic

    //MARK: - Initialization
    init(assembly: AssemblyLogic) {
        self.assembly = assembly
    }

    //MARK: - Methods
    func root() -> UIViewController {
        navigationController.setViewControllers([assembly.main()], animated: false)
        return navigationController
    }

    func routeToDetail() {
        navigationController.pushViewController(assembly.main(), animated: true)
    }

    func routeToMain() {
        navigationController.pushViewController(assembly.detail(), animated: true)
    }
}
