//
//  HabitsViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/11/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit


class HabitsViewContoller: UIViewController {
    
    @IBOutlet weak var noHabitsLabel: UILabel!
    @IBOutlet weak var addNewHabitLabel: UILabel!
    
    @IBOutlet weak var newHabitButton: UIBarButtonItem!
    
    // TODO: TableView & ScrollView
    @IBOutlet weak var habitsTable: UITableView!
    
    var walkthroughSeen: Bool = true
    
    @IBOutlet weak var dailyHabitsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noHabitsLabel.isHidden = false
        addNewHabitLabel.isHidden = false
        
        dailyHabitsView.isHidden = true
        
        // habitsTable.separatorStyle = .none
        
        if self.traitCollection.userInterfaceStyle == .dark {
            // User Interface is Dark
            newHabitButton.tintColor = .white
        } else {
            // User Interface is Light
            newHabitButton.tintColor = .black
        }
    }
    
}






class HabitsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var habits = Array<Habits>()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
        return self.habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell", for: indexPath)
        return cell
    }
    
}
