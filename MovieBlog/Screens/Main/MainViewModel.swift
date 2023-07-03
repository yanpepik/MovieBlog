//
//  MainViewModel.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import SwiftUI

final class MainViewModel: ObservableObject {

    //MARK: - Properties
    private let interactor: MainBusinessLogic
    private let delegate: MainScreenDelegate?

    //MARK: - Initialization
    init(interactor: MainBusinessLogic, delegate: MainScreenDelegate?) {
        self.delegate = delegate
        self.interactor = interactor
    }
}

//MARK: - MainViewModelProtocol
extension MainViewModel: MainViewModelProtocol {
    func buttonPressed() {
        delegate?.mainWantsToShowDetails()
    }
}
