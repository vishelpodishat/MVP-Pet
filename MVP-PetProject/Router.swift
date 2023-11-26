//
//  Router.swift
//  MVP-PetProject
//
//  Created by Алишер Сайдешев on 26.11.2023.
//

import UIKit

//changes

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initalController()
    func showDetail(comment: Comment?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?

    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func initalController() {
        if let navigationController = navigationController {
            guard let mainVC = assemblyBuilder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainVC]
        }
    }
    
    func showDetail(comment: Comment?) {
        if let navigationController = navigationController {
            guard let detailVC = assemblyBuilder?.createDetailModule(comment: comment,
                                                                     router: self) else { return }
            navigationController.pushViewController(detailVC, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
