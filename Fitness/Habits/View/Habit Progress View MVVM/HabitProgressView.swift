//
//  HabitProgressView.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 1/4/20.
//  Copyright © 2020 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class HabitProgressView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()

        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()

    }
    
    func dailyProgress() {
        
    }
    
    func weeklyProgress() {
        
    }
    
    func setupUI() {
        self.layer.cornerRadius = 12.0
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        
        let backColor = self.backgroundColor?.cgColor
        let secondBackColor = backColor?.copy(alpha: 0.1)
        
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.colors = [secondBackColor as Any, backColor as Any]

        self.layer.insertSublayer(gradient, at: 0)
        
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = #colorLiteral(red: 0.2784313725, green: 0.6235294118, blue: 0.2549019608, alpha: 1).cgColor;
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        self.layer.masksToBounds = true;
    }
    
}
