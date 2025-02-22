//
//  SearchTextField.swift
//  Menu
//
//  Created by Abdulkabir MAc on 21/02/2025.
//

import UIKit

class SearchTextField: UITextField {
    
    // You can tweak these constants or make them configurable
    private let searchPlaceholder = "Search foods..."
    private let satoshiFontName = "Satoshi-Regular"
    private let fontSize: CGFloat = 14.0
    
    // Color #9D9EA1
    private let placeholderColor = UIColor(
        red: 157.0/255.0,
        green: 158.0/255.0,
        blue: 161.0/255.0,
        alpha: 1.0
    )
    
    // Background #F7F9FC
    private let backgroundColorHex = UIColor(
        red: 247.0/255.0,
        green: 249.0/255.0,
        blue: 252.0/255.0,
        alpha: 1.0
    )
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearchField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSearchField()
    }
    
    // MARK: - Setup
    
    private func setupSearchField() {
        translatesAutoresizingMaskIntoConstraints = false
//        borderStyle = .roundedRect
        
        // 1) Background color
        backgroundColor = backgroundColorHex
        
        // 2) Font & text color for typed text
        let font = UIFont(name: satoshiFontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        self.font = font
        self.textColor = placeholderColor
        
        // 3) Custom placeholder
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: placeholderColor
        ]
        attributedPlaceholder = NSAttributedString(string: searchPlaceholder, attributes: placeholderAttributes)
        
        // 4) Left icon (SF Symbol: magnifyingglass)
        let iconImageView = UIImageView(image: UIImage(named: "search"))
        iconImageView.tintColor = placeholderColor
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.frame = CGRect(x: 8, y: 0, width: 20, height: 20)
        
        // 5) Container for the icon so we can add horizontal padding
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 20))
        leftPaddingView.addSubview(iconImageView)
        
        leftView = leftPaddingView
        leftViewMode = .always
    }
}
