//
//  AddFoodViewController.swift
//  Menu
//
//  Created by Abdulkabir MAc on 22/02/2025.
//

import UIKit
import Photos

class AddFoodViewController: UIViewController {
    var images = [UIImage]()
    // MARK: - UI Elements
    
    let topBarView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        
        let bottomBorderView = UIView()
        bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        bottomBorderView.backgroundColor = UIColor(
            red: 228.0/255.0,
            green: 231.0/255.0,
            blue: 236.0/255.0,
            alpha: 1.0
        )
        
        v.addSubview(bottomBorderView)
        NSLayoutConstraint.activate([
            bottomBorderView.heightAnchor.constraint(equalToConstant: 1),
            bottomBorderView.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            bottomBorderView.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            bottomBorderView.bottomAnchor.constraint(equalTo: v.bottomAnchor)
        ])
        
        return v
    }()

    let backButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "Icon Container"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = #colorLiteral(red: 0.1137254902, green: 0.1411764706, blue: 0.2, alpha: 1)
        btn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        return btn
    }()
    
  let titleLabel: UILabel = {
        let lbl = MenuRegularLabel()
        lbl.text = "Add new food"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let takePhotoButton: VerticalIconButton = {
        let btn = VerticalIconButton()
        btn.setIcon(UIImage(named: "Camera"))
        btn.setTitle("Take photo")
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 1
        btn.layer.borderColor = #colorLiteral(red: 0.8941176471, green: 0.9058823529, blue: 0.9254901961, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let uploadButton: VerticalIconButton = {
        let btn = VerticalIconButton()
        btn.setIcon(UIImage(named: "UploadSimple"))
        btn.setTitle("Upload")
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 8
        btn.layer.borderWidth = 1
        btn.layer.borderColor = #colorLiteral(red: 0.8941176471, green: 0.9058823529, blue: 0.9254901961, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    // Form labels
    let nameLabel = formLabel("Name")
    let descriptionLabel = formLabel("Description")
    let categoryLabel = formLabel("Category")
    let caloriesLabel = formLabel("Calories")
    let tagsLabel = formLabel("Tags")
    
    // Reusable custom text fields
    let nameTextField = CustomTextField(placeholder: "Enter food name")
    let categoryTextField = CustomTextField(placeholder: "Select category")
    let caloriesTextField = CustomTextField(placeholder: "Enter number of calories")
    let tagsTextField = CustomTextField(placeholder: "Add a tag")
    
    let descriptionTextField: PlaceholderTextView = {
        let descTextView = PlaceholderTextView()
        descTextView.placeholder = "Enter food description"
        return descTextView
    }()
    
    // A small helper label under the tags text field
    let tagsNoteLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Press enter once you've typed a tag."
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = .gray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    // "Add food" button
    let addFoodButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Add food", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 8
        btn.translatesAutoresizingMaskIntoConstraints = false
        // btn.addTarget(self, action: #selector(didTapAddFood), for: .touchUpInside)
        return btn
    }()
    
    // Scroll view + content container (if the screen might be tall)
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let contentView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        uploadButton.isUserInteractionEnabled = true
        takePhotoButton.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapUpload))
        uploadButton.addGestureRecognizer(tapGesture)
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(didTapTakePhoto))
        takePhotoButton.addGestureRecognizer(tapGesture1)
        setupLayout()
    }
    
    // MARK: - Helpers
    
    /// Example action if you have a back button
    @objc private func didTapBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    /// Example action for "Add food" button
    @objc private func didTapAddFood() {
        // Handle form submission
    }
    
    @objc private func didTapUpload() {
        print("Tapped upload")
        self.openPicker(isCamera: false)
    }
    
    @objc private func didTapTakePhoto() {
        print("Tapped take photo")
        self.openPicker(isCamera: true)
    }
}

// A helper function to create a consistent label for forms
fileprivate func formLabel(_ text: String) -> UILabel {
    let lbl = UILabel()
    lbl.text = text
    lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    lbl.textColor = .black
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
}

