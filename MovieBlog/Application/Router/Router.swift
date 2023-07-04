//
//  Router.swift
//  MovieBlog
//
//  Created by Yan Pepik on 30/06/2023.
//

import UIKit

final class Router: RouterProtocol {
    //MARK: - Properties
    let navigationController = UINavigationController()
    let assembly: AssemblyProtocol

    //MARK: - Initialization
    init(assembly: AssemblyProtocol) {
        self.assembly = assembly
        navigationController.setViewControllers([assembly.main(with: self)], animated: false)
    }
}

//MARK: - MainScreenDelegate
extension Router: MainScreenDelegate {
    func mainWantsToShowDetails() {
        navigationController.pushViewController(assembly.detail(with: self), animated: true)
    }
}

//MARK: - DetailScreenDelegate
extension Router: DetailScreenDelegate {
    func detailWantsToShowDetails() {
        navigationController.pushViewController(assembly.detail(with: self), animated: true)
    }
}
