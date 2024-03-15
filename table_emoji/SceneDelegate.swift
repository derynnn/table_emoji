//
//  SceneDelegate.swift
//  table_emoji
//
//  Created by Anastasia Tochilova  on 11.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setupRootView(windowScene: windowScene)
    }
    
    // MARK: - Private
    private func setupRootView(windowScene: UIWindowScene) {
        let viewController = EmojiViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
