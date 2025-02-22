//
//  TextField.swift
//  Menu
//
//  Created by Abdulkabir MAc on 22/02/2025.
//

import UIKit

class CustomTextField: UITextField {
    
    // Adjust these as needed
    private let placeholderFontSize: CGFloat = 14
    private let textFieldFontSize: CGFloat = 14
    private let satoshiFontName = "Satoshi-Regular" // Make sure this matches your actual font name
    
    // Example color #9D9EA1 for text/placeholder
    private let textColorHex = UIColor(
        red: 157.0/255.0,
        green: 158.0/255.0,
        blue: 161.0/255.0,
        alpha: 1.0
    )
    
    // Border color #98A2B3
    private let borderColorHex = UIColor(
        red: 152.0/255.0,
        green: 162.0/255.0,
        blue: 179.0/255.0,
        alpha: 1.0
    ).cgColor
    
    init(placeholder: String) {
        super.init(frame: .zero)
        setupAppearance(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAppearance(placeholder: "")
    }
    
    private func setupAppearance(placeholder: String) {
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .none
        
        // Rounded corners
        layer.cornerRadius = 6
        
        // White background
        backgroundColor = .white
        
        // 1px border, color #98A2B3
        layer.borderWidth = 1
        layer.borderColor = borderColorHex
        
        textAlignment = .left
        
        // Set custom font (fallback to system if not found)
        let font = UIFont(name: satoshiFontName, size: textFieldFontSize)
            ?? UIFont.systemFont(ofSize: textFieldFontSize)
        self.font = font
        self.textColor = textColorHex
        
        // Placeholder styling
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColorHex
        ]
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttributes)
        
        // Some padding on left
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 1))
        self.leftView = leftView
        self.leftViewMode = .always
        
        // Optional: give a fixed height
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
