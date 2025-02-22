//
//  TextView.swift
//  Menu
//
//  Created by Abdulkabir MAc on 22/02/2025.
//

import UIKit

/// A UITextView that shows a placeholder when empty, with a custom border.
class PlaceholderTextView: UITextView {
    
    // MARK: - Properties
    
    /// The placeholder string that appears when there's no text.
    var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
        }
    }
    
    /// The color used for the placeholder text. Default is a light gray.
    var placeholderColor: UIColor = UIColor(
        red: 157.0/255.0,
        green: 158.0/255.0,
        blue: 161.0/255.0,
        alpha: 1.0
    ) {
        didSet {
            placeholderLabel.textColor = placeholderColor
        }
    }
    
    // A private label to show the placeholder text
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Setup
    
    private func commonInit() {
        // 1) Style the text view
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        // Border color #98A2B3 => (152, 162, 179)
        layer.borderWidth = 1
        layer.borderColor = UIColor(
            red: 152.0/255.0,
            green: 162.0/255.0,
            blue: 179.0/255.0,
            alpha: 1.0
        ).cgColor
        
        // Optionally, round the corners
        layer.cornerRadius = 6
        clipsToBounds = true
        
        // 2) Configure the placeholder label
        placeholderLabel.textColor = placeholderColor
        placeholderLabel.font = font ?? UIFont.systemFont(ofSize: 14)
        
        addSubview(placeholderLabel)
        
        // 3) Constraints for the placeholder label (some padding inside)
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            placeholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
            // No explicit bottom constraint needed, it will size to its content
        ])
        
        // 4) Listen for text changes to hide/show placeholder
        // We can use NotificationCenter or set the delegate. Here, we use notifications.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textDidChangeNotification),
            name: UITextView.textDidChangeNotification,
            object: self
        )
        
        // Initially show placeholder if text is empty
        updatePlaceholderVisibility()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Placeholder Logic
    
    @objc private func textDidChangeNotification(_ notification: Notification) {
        if let object = notification.object as? PlaceholderTextView, object == self {
            updatePlaceholderVisibility()
        }
    }
    
    private func updatePlaceholderVisibility() {
        // Hide placeholder label if there's any text, otherwise show it
        placeholderLabel.isHidden = !text.isEmpty
    }
}
