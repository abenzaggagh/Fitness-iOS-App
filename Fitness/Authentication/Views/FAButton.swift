//
//  FAButton.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/4/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class FAButton: UIButton {


    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 12
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = 12
        self.showsTouchWhenHighlighted = true
    }
    
}
