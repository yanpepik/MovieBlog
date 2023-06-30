//
//  Assembly.swift
//  MovieBlog
//
//  Created by Yan Pepik on 30/06/2023.
//

import Foundation
import SwiftUI

protocol AssemblyLogic: AnyObject {
    func main() -> UIViewController
    func detail() -> UIViewController
}

final class Assembly: AssemblyLogic {
    //MARK: - Properties
    weak var router: RoutingLogic?

    //MARK: - AssemblyLogic
    func main() -> UIViewController {
        guard let router else { return UIViewController() }

        let interactor = MainInteractor()
        let viewModel = MainViewModel(interactor: interactor, router: router)
        let view = MainView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)

        return viewController
    }

    func detail() -> UIViewController {
        guard let router else { return UIViewController() }

        let interactor = DetailInteractor()
        let viewModel = DetailViewModel(interactor: interactor, router: router)
        let view = DetailView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)

        return viewController
    }
}
