//
//  DetailViewController.swift
//  MVP-PetProject
//
//  Created by Алишер Сайдешев on 26.11.2023.
//

import UIKit

final class DetailViewController: UIViewController {

    // MARK: - Properties
    var presenter: DetailViewPresenterProtocol!

    // MARK: - UI
    private let label = UILabel()
    private let button = UIButton(type: .system)

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.setComment()
        setupViews()
        setupConstraints()
    }
    // MARK: - Setup Views

    private func setupViews() {
        view.addSubview(label)
        view.addSubview(button)
        view.backgroundColor = .systemBackground
        style()
    }

    private func style() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pop", for: .normal)
        button.addTarget(self, action: #selector(didTappedActionButton), for: .touchUpInside)
    }

    // MARK: - Setup Constraints

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 500),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
//            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        label.text = comment?.body
    }
}

// MARK: - Action
extension DetailViewController {
    @objc private func didTappedActionButton() {
        presenter.tap()
    }
}
