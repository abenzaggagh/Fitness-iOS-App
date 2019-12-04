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
    
}


extension UIView {
    
    func setShadowView(){
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.5
    }
    
}
