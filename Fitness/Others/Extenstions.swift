//
//  Extenstions.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/4/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setIcon(_ image: UIImage) {
       
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
       
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 30))
        
        iconContainerView.addSubview(iconView)
        
        leftView = iconContainerView
        leftViewMode = .always
        
    }
    
    func setBottomBorder() {
        
        let border = CALayer()
        let width = CGFloat(1.0)
        
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - width, width: frame.size.width, height: frame.size.height)

        border.borderWidth = width
        
        layer.addSublayer(border)
        layer.masksToBounds = true
        
    }
    
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
        
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        
        animation.fromValue = baseColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        
        if revert {
            animation.autoreverses = true
        } else {
            animation.autoreverses = false
        }
        
        self.layer.add(animation, forKey: "")

        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        
        shake.duration = 0.07
        shake.repeatCount = shakes
        
        if revert {
            shake.autoreverses = true
        } else {
            shake.autoreverses = false
        }
        
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        
        self.layer.add(shake, forKey: "position")
        
    }
    
}


extension UIView {
    
    func setShadowView(){
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.5
    }
    
}


extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
