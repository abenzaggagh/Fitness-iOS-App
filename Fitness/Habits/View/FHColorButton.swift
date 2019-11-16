//
//  FHColorButton.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/16/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

@IBDesignable
class FHColorButton: UIButton {

    @IBInspectable var habitColor: UIColor = .white
    @IBInspectable var habitColorIsOn: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initButton()
    }
    
    func initButton() {
        setTitleColor(habitColor, for: .normal)
        backgroundColor = habitColor
    }
    
}
