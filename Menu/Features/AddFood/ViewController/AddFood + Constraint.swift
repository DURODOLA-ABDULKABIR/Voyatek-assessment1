//
//  AddFood + Constraint.swift
//  Menu
//
//  Created by Abdulkabir MAc on 22/02/2025.
//

import UIKit

extension AddFoodViewController{
    
    func setupLayout() {

        view.addSubview(topBarView)
        NSLayoutConstraint.activate([
            topBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBarView.heightAnchor.constraint(equalToConstant: 70) // adjust as needed
        ])
        
        // Add back button and title label to top bar
        topBarView.addSubview(backButton)
        topBarView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: topBarView.leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: topBarView.centerYAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            
            titleLabel.centerYAnchor.constraint(equalTo: topBarView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 10),
        ])
        
        // 2) Add scroll view below the top bar
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topBarView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // 3) Add a contentView inside the scroll view
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            // ensures contentView is same width as scrollView
        ])
        
        // 4) Add the "Take photo" and "Upload" buttons in a horizontal stack
        let photoUploadStack = UIStackView(arrangedSubviews: [takePhotoButton, uploadButton])
        photoUploadStack.axis = .horizontal
        photoUploadStack.distribution = .fillEqually
        photoUploadStack.spacing = 8
        photoUploadStack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(photoUploadStack)
        
        // 5) Add all the form labels and text fields
        // We'll stack them vertically in a single UIStackView for simplicity
        descriptionTextField.heightAnchor.constraint(equalToConstant: 104).isActive = true

        let formStack = UIStackView(arrangedSubviews: [
            nameLabel, nameTextField,
            descriptionLabel, descriptionTextField,
            categoryLabel, categoryTextField,
            caloriesLabel, caloriesTextField,
            tagsLabel, tagsTextField, tagsNoteLabel
        ])
        formStack.axis = .vertical
        formStack.spacing = 16
        formStack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(formStack)
        
        // 6) Add the "Add food" button at the bottom of the form
        contentView.addSubview(addFoodButton)
        
        // 7) Layout constraints for these
        NSLayoutConstraint.activate([
            // Photo/Upload stack at top
            photoUploadStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            photoUploadStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            photoUploadStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            photoUploadStack.heightAnchor.constraint(equalToConstant: 80),
            
            // Form stack below the photoUploadStack
            formStack.topAnchor.constraint(equalTo: photoUploadStack.bottomAnchor, constant: 24),
            formStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            formStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            // "Add food" button below the form
            addFoodButton.topAnchor.constraint(equalTo: formStack.bottomAnchor, constant: 32),
            addFoodButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            addFoodButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            addFoodButton.heightAnchor.constraint(equalToConstant: 44),
            
            // Bottom anchor for scroll
            addFoodButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
    }
}
