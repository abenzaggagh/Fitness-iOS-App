//
//  HabitMarkCompletedButton.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 1/2/20.
//  Copyright © 2020 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

@IBDesignable
class HabitMarkCompletedButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 5.0
        
        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0.2784313725, green: 0.6235294118, blue: 0.2549019608, alpha: 1)
        
        self.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.setTitleColor(#colorLiteral(red: 0.2784313725, green: 0.6235294118, blue: 0.2549019608, alpha: 1), for: .normal)
        
        self.layer.masksToBounds = true

        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.1
        self.layer.shadowColor = self.backgroundColor?.cgColor;
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.layer.cornerRadius = 5.0
        
        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0.2784313725, green: 0.6235294118, blue: 0.2549019608, alpha: 1)
        
        self.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.setTitleColor(#colorLiteral(red: 0.2784313725, green: 0.6235294118, blue: 0.2549019608, alpha: 1), for: .normal)
        
        self.layer.masksToBounds = true

        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.1
        self.layer.shadowColor = self.backgroundColor?.cgColor;
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }
    
    func isCompleted() {
        
        self.isEnabled = false
        
        self.setTitle("Completed", for: .normal)
        self.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        self.layer.backgroundColor = #colorLiteral(red: 0.2784313725, green: 0.6235294118, blue: 0.2549019608, alpha: 1)
        
        // TODO: Add Done Icon beside Text
        
    }
    
    func isNotCompleted() {
        
        self.isEnabled = true
        
        self.setTitle("Mark Complete", for: .normal)
        
        self.layer.borderColor = #colorLiteral(red: 0.2784313725, green: 0.6235294118, blue: 0.2549019608, alpha: 1)
        
        self.setTitleColor(#colorLiteral(red: 0.2784313725, green: 0.6235294118, blue: 0.2549019608, alpha: 1), for: .normal)

        self.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    

}
