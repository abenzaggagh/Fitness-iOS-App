//
//  FHColorButton.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/16/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit


class FHColorButton: UIButton {

    @IBInspectable var habitColor: UIColor?
    @IBInspectable var habitColorSelected: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initButton()
    }
    
    private func initButton() {
        
        clipsToBounds = true
        
        backgroundColor = habitColor ?? Colors.gray
        
        layer.borderWidth = 3
        layer.borderColor = habitColor?.cgColor
        layer.backgroundColor = habitColor?.cgColor

        layer.cornerRadius = min(frame.size.height, frame.size.width) / 2
        
        addTarget(self, action: #selector(FHColorButton.buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        activateButton(bool: !habitColorSelected)
    }
    
    private func activateButton(bool: Bool) {
        habitColorSelected = bool
        
        layer.borderColor = bool ? Colors.darkGray.cgColor : layer.backgroundColor
        
    }
}

struct Colors {
    
    static var black = UIColor.black
    
    static var gray = UIColor.gray
    static var darkGray = UIColor.darkGray
    static var lightGray = UIColor.lightGray
    
}
