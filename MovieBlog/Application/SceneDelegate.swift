//
//  SceneDelegate.swift
//  MovieBlog
//
//  Created by Yan Pepik on 29/06/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let assembly = Assembly()
        let router = Router(assembly: assembly)

        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = router.navigationController
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
}
