//
//  FWPauseWorkoutButton.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 1/6/20.
//  Copyright © 2020 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

@IBDesignable
class PauseWorkoutButton: UIButton {

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

        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        self.setTitleColor(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), for: .normal)
        
        self.layer.shadowRadius = 0.1
        self.layer.shadowOpacity = 0.1
        self.layer.shadowColor = self.backgroundColor?.cgColor;
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        self.layer.masksToBounds = true
        
    }

}


