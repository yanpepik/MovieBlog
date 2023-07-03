//
//  AssemblyProtocol.swift
//  MovieBlog
//
//  Created by Yan Pepik on 03/07/2023.
//

import UIKit

protocol AssemblyProtocol: AnyObject {
    func main(with delegate: MainScreenDelegate?) -> UIViewController
    func detail(with delegate: DetailScreenDelegate?) -> UIViewController
}
