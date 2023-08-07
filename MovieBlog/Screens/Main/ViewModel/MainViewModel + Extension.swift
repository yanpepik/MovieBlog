//
//  MainViewModel + Extension.swift
//  MovieBlog
//
//  Created by Yan Pepik on 10/07/2023.
//

import Foundation
import Combine

import Foundation
import Combine

extension MainViewModel {
    struct Data {
        let items: [Item]
        var state: State

        enum State {
            case initial
            case loading
            case loaded
            case error(message: String)

            var errorMessage: String {
                guard case .error(let message) = self else { return "" }
                return message
            }

            var isFailed: Bool {
                get {
                    switch self {
                    case .error:
                        return true
                    default:
                        return false
                    }
                }
                set {}
            }
        }
    }
}
