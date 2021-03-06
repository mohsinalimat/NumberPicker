//
//  UIView+Extensions.swift  
//
//  Created by Yash Thaker on 01/04/18.
//  Copyright © 2018 Yash Thaker. All rights reserved.
//

import UIKit

extension UIView {
    
    enum gradientType {
        case vertical
        case horizontal
        case cross
    }
    
    func applyGradient(colors:[UIColor], type: gradientType) {
        var endPoint: CGPoint!
        switch (type) {
        case .horizontal:
            endPoint = CGPoint(x: 1, y: 0)
        case .vertical:
            endPoint = CGPoint(x: 0, y: 1)
        case .cross:
            endPoint = CGPoint(x: 1, y: 1)
        }
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors.map{ $0.cgColor}
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = endPoint
        
        //self.layer.addSublayer(gradientLayer)
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
