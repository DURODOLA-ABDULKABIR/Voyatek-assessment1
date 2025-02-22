//
//  HomeViewController.swift
//  Menu
//
//  Created by Abdulkabir MAc on 21/02/2025.
//

import UIKit

class HomeViewController: UIViewController, FoodsProtocol {
    
    let foodsNetworkManager = FoodsNetwork()
    
    // MARK: - UI Elements
    
    let avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "avatar")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let notificationImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Notification icon")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let addImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "pluscircle")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let addView: UIView = {
        let iv = UIView()
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 21
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let greetingLabel: UILabel = {
        let label = MenuBoldLabel()
        label.text = "Hey there, Lucy!"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let questionLabel: UILabel = {
        let label = MenuRegularLightLabel()
        label.text = "Are you excited to create a tasty dish today?"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let searchTextField = SearchTextField()
    
    let allButton: UIButton = {
        let button = MenuButton()
        button.setTitle("All", for: .normal)
        button.setFontSize(12)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.431372549, blue: 0.9921568627, alpha: 1)
        button.addTarget(self, action: #selector(didTapAll), for: .touchUpInside)
        return button
    }()
    
    let morningFeastButton: UIButton = {
        let button = MenuButton()
        button.setTitle("Morning Feast", for: .normal)
        button.setFontSize(12)
        button.addTarget(self, action: #selector(didTapMorningFeast), for: .touchUpInside)
        return button
    }()
    
    let sunriseMealButton: UIButton = {
        let button = MenuButton()
        button.setTitle("Sunrise Meal", for: .normal)
        button.setFontSize(12)
        button.addTarget(self, action: #selector(didTapSunriseMeal), for: .touchUpInside)
        return button
    }()
    
    let dawnDelicaciesButton: UIButton = {
        let button = MenuButton()
        button.setTitle("Dawn Delicacies", for: .normal)
        button.setFontSize(12)
        button.addTarget(self, action: #selector(didTapDawnDelicacies), for: .touchUpInside)
        return button
    }()
    
    // A stack view to hold the 4 buttons horizontally
    let buttonStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .fillProportionally
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let allFoodsLabel: UILabel = {
        let label = MenuBoldLabel()
        label.text = "All Foods"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    // MARK: - Data
    
    var foods: [FoodDatum] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        buttonStackView.addArrangedSubview(allButton)
        buttonStackView.addArrangedSubview(morningFeastButton)
        buttonStackView.addArrangedSubview(sunriseMealButton)
        buttonStackView.addArrangedSubview(dawnDelicaciesButton)
        
        
        // Add subviews
        addView.addSubview(addImageView)
        view.addSubview(greetingLabel)
        view.addSubview(questionLabel)
        view.addSubview(searchTextField)
        view.addSubview(buttonStackView)
        view.addSubview(allFoodsLabel)
        view.addSubview(tableView)
        view.addSubview(avatarImageView)
        view.addSubview(notificationImageView)
        view.addSubview(addView)
        // Setup constraints
        setupConstraints()
        
        // TableView setup
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(FoodTableViewCell.self, forCellReuseIdentifier: "FoodCell")
        foodsNetworkManager.delegate = self
        self.activityIndicatorStart()
        
        addView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapTappableView))
        addView.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        foodsNetworkManager.fetchFoods()
    }
    
    // MARK: - Button Actions
    
    @objc private func didTapAll() {
        print("All button tapped")
        // Filter your data or do something else
    }
    
    @objc private func didTapMorningFeast() {
        print("Morning Feast button tapped")
        // ...
    }
    
    @objc private func didTapSunriseMeal() {
        print("Sunrise Meal button tapped")
        // ...
    }
    
    @objc private func didTapDawnDelicacies() {
        print("Dawn Delicacies button tapped")
        // ...
    }
    
    @objc private func didTapTappableView() {
        let addFoodVC = AddFoodViewController()
        addFoodVC.modalPresentationStyle = .fullScreen
        present(addFoodVC, animated: true)
    }
}

extension HomeViewController {
    func getFoodsSuccess(foods: [FoodDatum]) {
        self.activityIndicatorStop()
        self.foods = foods
        tableView.reloadData()
    }
    
    func getFoodsError(errorMessage: String) {
        self.activityIndicatorStop()
        showAlert(title: "Error", message: errorMessage)
    }
    
    func noResponse() {
        self.activityIndicatorStop()
        showAlert(title: "Error", message: AppError.apiError)
    }
}
