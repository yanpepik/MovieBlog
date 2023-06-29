//
//  MainAssembly.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import UIKit
import SwiftUI

enum MainAssembly {
    static func assemble(navigationController: UINavigationController) -> UIViewController {
        let router = MainRouter(navigationController: navigationController)
        let interactor = MainInteractor()
        let viewModel = MainViewModel(interactor: interactor, router: router)
        let view = MainView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)

        return viewController
    }
}
