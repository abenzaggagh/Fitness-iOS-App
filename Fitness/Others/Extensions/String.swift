//
//  String.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 1/6/20.
//  Copyright © 2020 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation

extension String {

    func timeString(from timeInterval: TimeInterval) -> String {
        let seconds = Int(timeInterval.truncatingRemainder(dividingBy: 60))
        let minutes = Int(timeInterval.truncatingRemainder(dividingBy: 60 * 60) / 60)
        let hours = Int(timeInterval / 3600)
        return String(format: "%.2d:%.2d:%.2d", hours, minutes, seconds)
    }

    
}
