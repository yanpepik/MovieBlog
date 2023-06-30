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
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        let router = createRouter()
        window?.rootViewController = router.root()
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }

    private func createRouter() -> RoutingLogic {
        let assembly = Assembly()
        let router = Router(assembly: assembly)
        assembly.router = router

        return router
    }
}
