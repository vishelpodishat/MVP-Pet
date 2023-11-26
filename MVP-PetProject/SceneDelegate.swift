//
//  SceneDelegate.swift
//  MVP-PetProject
//
//  Created by Алишер Сайдешев on 26.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        let assemblyBuilder = AssemblyModuleBuilder()
        let router = Router(navigationController: navigationController,
                            assemblyBuilder: assemblyBuilder)
        router.initalController()
        window.rootViewController = navigationController
        self.window = window
        self.window?.makeKeyAndVisible()
    }


}

