//
//  DetailAssembly.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import UIKit
import SwiftUI

enum DetailAssembly {
    static func assemble(navigationController: UINavigationController) -> UIViewController {
        let router = DetailRouter(navigationController: navigationController)
        let interactor = DetailInteractor()
        let viewModel = DetailViewModel(interactor: interactor, router: router)
        let view = DetailView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)

        return viewController
    }
}
