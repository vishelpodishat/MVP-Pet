//
//  MainPresenter.swift
//  MVP-PetProject
//
//  Created by Алишер Сайдешев on 26.11.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainPresenterViewProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? { get set }
    func tapOnTheComment(comment: Comment?)
}

final class MainPresenter: MainPresenterViewProtocol {
    var comments: [Comment]?
    var router: RouterProtocol?
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!

    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }

    func getComments() {
        networkService.getComment { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }

    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }

}
