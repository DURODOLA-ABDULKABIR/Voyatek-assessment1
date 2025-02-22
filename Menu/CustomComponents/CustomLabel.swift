//
//  CustomLabel.swift
//  Menu
//
//  Created by Abdulkabir MAc on 21/02/2025.
//

import UIKit

/// A UILabel subclass that always uses the Satoshi font
class MenuRegularLabel: UILabel {
    
    // Customize the font name and size here
    private let satoshiFontName = "Satoshi-Regular"
    private let defaultFontSize: CGFloat = 16
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFont()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFont()
    }
    
    /// If you want to change the font size later, call this with a new size.
    func setFontSize(_ size: CGFloat) {
        self.font = UIFont(name: satoshiFontName, size: size)
    }
    
    private func setupFont() {
        // Fallback to system font if the Satoshi font isn't found
        self.font = UIFont(name: satoshiFontName, size: defaultFontSize)
            ?? UIFont.systemFont(ofSize: defaultFontSize)
        self.textColor = UIColor(
                    red: 29.0/255.0,
                    green: 36.0/255.0,
                    blue: 51.0/255.0,
                    alpha: 1.0
                )
    }
}

class MenuRegularLightLabel: UILabel {
    
    // Customize the font name and size here
    private let satoshiFontName = "Satoshi-Regular"
    private let defaultFontSize: CGFloat = 16
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFont()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFont()
    }
    
    /// If you want to change the font size later, call this with a new size.
    func setFontSize(_ size: CGFloat) {
        self.font = UIFont(name: satoshiFontName, size: size)
    }
    
    private func setupFont() {
        // Fallback to system font if the Satoshi font isn't found
        self.font = UIFont(name: satoshiFontName, size: defaultFontSize)
            ?? UIFont.systemFont(ofSize: defaultFontSize)
        self.textColor = UIColor(
                red: 157.0 / 255.0,
                green: 158.0 / 255.0,
                blue: 161.0 / 255.0,
                alpha: 1.0
            )
    }
}

class MenuBoldLabel: UILabel {
    
    // Customize the font name and size here
    private let satoshiFontName = "Satoshi-Bold"
    private let defaultFontSize: CGFloat = 16
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFont()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFont()
    }
    
    /// If you want to change the font size later, call this with a new size.
    func setFontSize(_ size: CGFloat) {
        self.font = UIFont(name: satoshiFontName, size: size)
    }
    
    private func setupFont() {
        // Fallback to system font if the Satoshi font isn't found
        self.font = UIFont(name: satoshiFontName, size: defaultFontSize)
            ?? UIFont.systemFont(ofSize: defaultFontSize)
        self.textColor = UIColor(
                    red: 29.0/255.0,
                    green: 36.0/255.0,
                    blue: 51.0/255.0,
                    alpha: 1.0
                )
    }
}
