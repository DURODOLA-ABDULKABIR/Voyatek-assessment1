//
//  Extension + HomeViewController.swift
//  Menu
//
//  Created by Abdulkabir MAc on 21/02/2025.
//

import UIKit

// MARK: - Constraints
extension HomeViewController {
  func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 42),
            avatarImageView.heightAnchor.constraint(equalToConstant: 42),
            
            notificationImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            notificationImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            notificationImageView.widthAnchor.constraint(equalToConstant: 42),
            notificationImageView.heightAnchor.constraint(equalToConstant: 42),
            
            greetingLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            questionLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 4),
            questionLabel.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: greetingLabel.trailingAnchor),
            
            searchTextField.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 16),
            searchTextField.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: greetingLabel.trailingAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            
            buttonStackView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 16),
            buttonStackView.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: greetingLabel.trailingAnchor),
            allButton.heightAnchor.constraint(equalToConstant: 40),
            allButton.widthAnchor.constraint(equalToConstant: 60),
            morningFeastButton.heightAnchor.constraint(equalToConstant: 40),
            sunriseMealButton.heightAnchor.constraint(equalToConstant: 40),
            dawnDelicaciesButton.heightAnchor.constraint(equalToConstant: 40),

            allFoodsLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 16),
            allFoodsLabel.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
            allFoodsLabel.trailingAnchor.constraint(equalTo: greetingLabel.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: allFoodsLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            addView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addView.widthAnchor.constraint(equalToConstant: 42),
            addView.heightAnchor.constraint(equalToConstant: 42),
            
            addImageView.bottomAnchor.constraint(equalTo: addView.bottomAnchor),
            addImageView.leadingAnchor.constraint(equalTo: addView.leadingAnchor),
            addImageView.trailingAnchor.constraint(equalTo: addView.trailingAnchor),
            addImageView.topAnchor.constraint(equalTo: addView.topAnchor),
        ])
    }
}
