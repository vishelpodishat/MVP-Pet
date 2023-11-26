//
//  DetailPresenter.swift
//  MVP-PetProject
//
//  Created by Алишер Сайдешев on 26.11.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol,
         networkService: NetworkServiceProtocol,
         router: RouterProtocol,
         comment: Comment?)
    func setComment()
    func tap()
}

class DetailPresenter: DetailViewPresenterProtocol {
    var comment: Comment?
    var router: RouterProtocol?
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!

    required init(view: DetailViewProtocol,
                  networkService: NetworkServiceProtocol,
                  router: RouterProtocol,
                  comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }

    func tap() {
        router?.popToRoot()
    }

    func setComment() {
        self.view?.setComment(comment: comment)
    }
}
