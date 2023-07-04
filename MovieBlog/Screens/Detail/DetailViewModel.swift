//
//  DetailViewModel.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import SwiftUI

final class DetailViewModel: ObservableObject {
    //MARK: - Properties
    private let interactor: DetailBusinessLogic
    private let delegate: DetailScreenDelegate?

    //MARK: - Initialization
    init(interactor: DetailBusinessLogic, delegate: DetailScreenDelegate?) {
        self.delegate = delegate
        self.interactor = interactor
    }
}

//MARK: - DetailViewModelProtocol
extension DetailViewModel: DetailViewModelProtocol {
    func buttonPressed() {
        delegate?.detailWantsToShowDetails()
    }
}
