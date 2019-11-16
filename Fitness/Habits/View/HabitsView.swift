//
//  HabitsCalendar.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/11/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

@IBDesignable
class HabitsCalendarView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


@IBDesignable
class HabitsWalkthrough: UIView {
    
    var backgroundImage: UIColor?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
}

@IBDesignable
class HabitCard: UIView {
    
    
    @IBInspectable var habitTitle: String = "Title"
    
    // Default Background: Gray
    @IBInspectable var habitBackgroundColor: UIColor = UIColor.gray
    
    override func draw(_ rect: CGRect) {
        let habitBackground = UIBezierPath(roundedRect: bounds, cornerRadius: CGFloat(16.0))
        habitBackground.addClip()
        habitBackgroundColor.setFill()
        
        habitBackground.fill()
    }
    
    
}



struct Colors {
    
    static var black = UIColor.black
    
    static var gray = UIColor.gray
    static var darkGray = UIColor.darkGray
    static var lightGray = UIColor.lightGray
    
}

