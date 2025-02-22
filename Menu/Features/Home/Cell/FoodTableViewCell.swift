//
//  FoodTableViewCell.swift
//  Menu
//
//  Created by Abdulkabir MAc on 21/02/2025.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    private let containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.cornerRadius = 4
        v.layer.borderWidth = 1
        v.layer.borderColor =  #colorLiteral(red: 0.8941176471, green: 0.9058823529, blue: 0.9254901961, alpha: 1)
        return v
    }()
    
    private let foodImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = MenuBoldLabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let likeImageView: UIImageView = {
           let iv = UIImageView()
           iv.image = UIImage(named: "tabheart")
           iv.contentMode = .scaleAspectFit
           iv.translatesAutoresizingMaskIntoConstraints = false
           return iv
       }()
    
    let calorieImageView: UIImageView = {
           let iv = UIImageView()
           iv.image = UIImage(named: "Fire")
           iv.contentMode = .scaleAspectFit
           iv.translatesAutoresizingMaskIntoConstraints = false
           return iv
       }()
    
    private let calorieLabel: UILabel = {
        let label = MenuRegularLightLabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.3921568627, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let calorieStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .fillProportionally
        sv.spacing = 4
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let descriptionLabel: UILabel = {
        let label = MenuRegularLabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Replace tagsLabel with a UICollectionView
    private let tagsCollectionView: UICollectionView = {
        // 1) Create a simple horizontal flow layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        
        // 2) Create the collection view with that layout
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    // We'll store the tags in this array, then reload the collection view
    private var tags: [String] = []
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add containerView
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        calorieStackView.addArrangedSubview(calorieImageView)
        calorieStackView.addArrangedSubview(calorieLabel)
        
        
        // Add subviews to containerView
        containerView.addSubview(foodImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(calorieStackView)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(tagsCollectionView)
        containerView.addSubview(likeImageView)
        
        // Register our custom TagCollectionViewCell
        tagsCollectionView.register(FoodTagsCollectionViewCell.self,
                                    forCellWithReuseIdentifier: FoodTagsCollectionViewCell.reuseIdentifier)
        
        // Set dataSource / delegate
        tagsCollectionView.dataSource = self
        tagsCollectionView.delegate = self
        
        // Apply constraints
        NSLayoutConstraint.activate([
            // Food image at the top
            foodImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            foodImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            foodImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            foodImageView.heightAnchor.constraint(equalToConstant: 200),
            
            // Title
            titleLabel.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: likeImageView.trailingAnchor, constant: -10),
            
            likeImageView.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 8),
            likeImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            likeImageView.widthAnchor.constraint(equalToConstant: 18),
            likeImageView.heightAnchor.constraint(equalToConstant: 18),
            
            // Calories
            calorieStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            calorieStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

            
            // Description
            descriptionLabel.topAnchor.constraint(equalTo: calorieLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            // Tags Collection View
            tagsCollectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            tagsCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            tagsCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            tagsCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            
            // If you want a fixed height for the tags row:
            tagsCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    func configure(with food: FoodDatum) {
        if !(food.foodImages?.isEmpty ?? false) {
            if let url = URL(string: food.foodImages?[0].imageURL ?? "") {
                foodImageView.loadImage(from: url)
                    }
        }
//        foodImageView.image = UIImage(named: food.imageName)
        titleLabel.text = food.name
        calorieLabel.text = "\(food.calories ?? 0) Calories"
        descriptionLabel.text = food.description
        
        // Update the tags array
        self.tags = food.foodTags ?? []
        // Reload the collection view to show the new tags
        tagsCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension FoodTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Number of tags
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    // Configure each tag cell
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FoodTagsCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? FoodTagsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let tagString = tags[indexPath.item]
        cell.configure(tag: tagString)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let tagText = tags[indexPath.item]
        let width = max(50, CGFloat(tagText.count * 6) + 24)
        return CGSize(width: width, height: 24)
    }
}

