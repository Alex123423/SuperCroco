//
//  Extension+UIView.swift
//  SuperCroco
//
//  Created by Келлер Дмитрий on 21.04.2023.
//

import UIKit
// MARK: - Set background color
extension UIView {
   
    func setupBackgroundColor() {
        let primaryColor = UIColor(
            red: 183/255,
            green: 235/255,
            blue: 150/255,
            alpha: 1
        )
        
        let secondaryColor = UIColor(
            red: 183/255,
            green: 255/255,
            blue: 150/255,
            alpha: 0.8
        )
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
