//
//  FoodTagsCollectionViewCell.swift
//  Menu
//
//  Created by Abdulkabir MAc on 21/02/2025.
//

import UIKit

class FoodTagsCollectionViewCell: UICollectionViewCell {
        
        static let reuseIdentifier = "FoodTagsCollectionViewCell"
        
        private let tagLabel: UILabel = {
            let label = MenuRegularLightLabel()
            label.font = UIFont.systemFont(ofSize: 12)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            contentView.layer.cornerRadius = 8
            contentView.backgroundColor = UIColor(
                        red: 251.0/255.0,
                        green: 241.0/255.0,
                        blue: 241.0/255.0,
                        alpha: 1.0
                    )
                    contentView.layer.masksToBounds = true
            
            contentView.addSubview(tagLabel)
            NSLayoutConstraint.activate([
                tagLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
                tagLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                tagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                tagLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configure(tag: String) {
            tagLabel.text = tag
        }

}
