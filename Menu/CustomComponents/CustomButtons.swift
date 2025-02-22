//
//  CustomButtons.swift
//  Menu
//
//  Created by Abdulkabir MAc on 21/02/2025.
//

import UIKit

class MenuButton: UIButton {
    
    // Customize the font name and size here
    private let satoshiFontName = "Satoshi-Regular"
    private let defaultFontSize: CGFloat = 14
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAppearance()
    }
    
    private func setupAppearance() {
        // Background color #F9FAFB
        self.backgroundColor = UIColor(
            red: 249.0/255.0,
            green: 250.0/255.0,
            blue: 251.0/255.0,
            alpha: 1.0
        )
        
        // Title (font) color #676E7E
        self.setTitleColor(
            UIColor(
                red: 103.0/255.0,
                green: 110.0/255.0,
                blue: 126.0/255.0,
                alpha: 1.0
            ),
            for: .normal
        )
        
        // Satoshi font (fallback to system font if not found)
        self.titleLabel?.font = UIFont(name: satoshiFontName, size: defaultFontSize)
            ?? UIFont.systemFont(ofSize: defaultFontSize)
        
        self.layer.cornerRadius = 4

    }
    
    /// Optional helper if you want to change the font size programmatically.
    func setFontSize(_ size: CGFloat) {
        self.titleLabel?.font = UIFont(name: satoshiFontName, size: size)
            ?? UIFont.systemFont(ofSize: size)
    }
}

class VerticalIconButton: UIControl {
    private let stackView = UIStackView()
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        // This control can be tapped
        addTarget(self, action: #selector(didTapSelf), for: .touchUpInside)

        // Configure stack
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure icon
        iconImageView.contentMode = .scaleAspectFit
        
        // Configure label
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textAlignment = .center
        
        // Add subviews
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(titleLabel)
        addSubview(stackView)
        
        // Layout
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        
        // Optional: style the background & border
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor(
            red: 228.0/255.0,
            green: 231.0/255.0,
            blue: 236.0/255.0,
            alpha: 1.0
        ).cgColor
        backgroundColor = .white
    }

    func setIcon(_ image: UIImage?) {
        iconImageView.image = image
    }

    func setTitle(_ text: String) {
        titleLabel.text = text
    }

    @objc private func didTapSelf() {
        // Handle tap (send actions, etc.)
        sendActions(for: .touchUpInside)
    }
}
