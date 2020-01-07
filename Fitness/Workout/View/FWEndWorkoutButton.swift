//
//  FWEndWorkoutButton.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 1/6/20.
//  Copyright © 2020 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

@IBDesignable
class EndWorkoutButton: UIButton {
    
    @IBInspectable var FWShadowRadius: CGFloat = 3.0
    @IBInspectable var FWShadowOpacity: Float = 0.2

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func setupUI() {
        
        self.layer.cornerRadius = 12
        
        self.layer.masksToBounds = true
        
        self.layer.shadowRadius = FWShadowRadius
        self.layer.shadowOpacity = FWShadowOpacity
        self.layer.shadowColor = self.backgroundColor?.cgColor;
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }
    
    
}
