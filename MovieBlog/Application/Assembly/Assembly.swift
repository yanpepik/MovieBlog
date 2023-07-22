//
//  Assembly.swift
//  MovieBlog
//
//  Created by Yan Pepik on 30/06/2023.
//

import Foundation
import SwiftUI

final class Assembly: AssemblyProtocol {

    func main(with delegate: MainScreenDelegate?) -> UIViewController {
        let networkService = NetworkService.shared
        let interactor = MainInteractor(networkService: networkService)
        let viewModel = MainViewModel(interactor: interactor, delegate: delegate)
        let view = MainView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)

        return viewController
    }

    func detail(with delegate: DetailScreenDelegate?) -> UIViewController {
        let interactor = DetailInteractor()
        let viewModel = DetailViewModel(interactor: interactor, delegate: delegate)
        let view = DetailView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)

        return viewController
    }
}
