//
//  HabitProgressView.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 12/8/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class HabitProgressView: UIProgressView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let maskLayerPath = UIBezierPath(roundedRect: bounds, cornerRadius: 4.0)
        let maskLayer = CAShapeLayer()
        
        maskLayer.frame = self.bounds
        maskLayer.path = maskLayerPath.cgPath
        
        layer.mask = maskLayer
        
    }

}
