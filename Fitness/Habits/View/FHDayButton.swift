//
//  FHDayButton.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/15/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

@IBDesignable
class FHDayButton: UIButton {

    @IBInspectable var habitDaySelected: Bool = true
    // @IBInspectable var habitDayTitle: String = "Mon"
    
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
        
        layer.borderColor = Colors.lightGray.cgColor
        
        layer.cornerRadius = frame.size.height / 2
        layer.backgroundColor = Colors.lightGray.cgColor
        
        setTitleColor(Colors.black, for: .normal)
        
        addTarget(self, action: #selector(FHDayButton.buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        activateButton(bool: !habitDaySelected)
    }
    
    private func activateButton(bool: Bool) {
        habitDaySelected = bool
        
        let color = bool ? Colors.lightGray : .clear
        let titleColor = bool ? Colors.black : Colors.darkGray
        
        backgroundColor = color
        
        setTitleColor(titleColor, for: .normal)
        
    }
    
    func isActive() -> Bool {
        return self.habitDaySelected
    }

}
