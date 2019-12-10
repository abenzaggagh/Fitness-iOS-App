//
//  HabitDetailsViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/26/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    var habit: Habit?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(habit?.name ?? "N/A")
        print(habit?.type ?? "N/A")
        print(habit?.longestStreak ?? "N/A")
        print(habit?.currentStreak ?? "N/A")
        print(habit?.goalFrequency ?? "N/A")
        print(habit?.goalPeriod ?? "N/A")
        print(habit?.startDate ?? "N/A")

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
