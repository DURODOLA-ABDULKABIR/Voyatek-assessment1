//
//  ActivityIndicator.swift
//  Menu
//
//  Created by Abdulkabir MAc on 22/02/2025.
//

//import UIKit

//extension UIViewController {
//    
//    struct Activity {
//        static let indicator = UIActivityIndicatorView(frame: CGRect(x: 5, y: 5, width: 50, height: 50))
//        static let overlay = UIView()
//    }
//    
//    func activityIndicatorStart() {
//        DispatchQueue.main.async { [self] in
//            self.view.isUserInteractionEnabled = false
//            Activity.overlay.isHidden = false
//            Activity.overlay.translatesAutoresizingMaskIntoConstraints = false
//            Activity.overlay.layer.backgroundColor = UIColor.clear.cgColor
//            Activity.overlay.layer.cornerRadius = 10
//            
//            view.addSubview(Activity.overlay)
//            
//            Activity.overlay.snp.makeConstraints { make in
//                make.centerX.centerY.equalTo(view)
//                make.width.height.equalTo(75)
//            }
//            
//            Activity.indicator.hidesWhenStopped = true
//            Activity.indicator.style = UIActivityIndicatorView.Style.large
//            Activity.indicator.color = .gray
//            Activity.indicator.startAnimating()
//            
//            Activity.overlay.addSubview(Activity.indicator)
//            
//            Activity.indicator.snp.makeConstraints { make in
//                make.centerX.centerY.equalTo(Activity.overlay)
//            }
//        }
//    }
//    
//    func activityIndicatorStop() {
//        DispatchQueue.main.async {
//            self.view.isUserInteractionEnabled = true
//            Activity.overlay.isHidden = true
//            Activity.indicator.stopAnimating()
//        }
//    }
//}

import UIKit

extension UIViewController {
    
    struct Activity {
        static let indicator = UIActivityIndicatorView(frame: CGRect(x: 5, y: 5, width: 50, height: 50))
        static let overlay = UIView()
    }
    
    func activityIndicatorStart() {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = false
            Activity.overlay.isHidden = false
            Activity.overlay.translatesAutoresizingMaskIntoConstraints = false
            Activity.overlay.layer.backgroundColor = UIColor.clear.cgColor
            Activity.overlay.layer.cornerRadius = 10
            
            // Add overlay to the main view
            self.view.addSubview(Activity.overlay)
            
            // Set up constraints for overlay (75x75, centered)
            NSLayoutConstraint.activate([
                Activity.overlay.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                Activity.overlay.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                Activity.overlay.widthAnchor.constraint(equalToConstant: 75),
                Activity.overlay.heightAnchor.constraint(equalToConstant: 75)
            ])
            
            // Configure and start the indicator
            Activity.indicator.hidesWhenStopped = true
            Activity.indicator.style = .large
            Activity.indicator.color = .gray
            Activity.indicator.startAnimating()
            
            // Add indicator to the overlay
            Activity.indicator.translatesAutoresizingMaskIntoConstraints = false
            Activity.overlay.addSubview(Activity.indicator)
            
            // Center the indicator inside the overlay
            NSLayoutConstraint.activate([
                Activity.indicator.centerXAnchor.constraint(equalTo: Activity.overlay.centerXAnchor),
                Activity.indicator.centerYAnchor.constraint(equalTo: Activity.overlay.centerYAnchor)
            ])
        }
    }
    
    func activityIndicatorStop() {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = true
            Activity.overlay.isHidden = true
            Activity.indicator.stopAnimating()
        }
    }
}
