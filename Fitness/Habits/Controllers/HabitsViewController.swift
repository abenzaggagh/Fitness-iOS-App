//
//  HabitsViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/11/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class HabitsViewContoller: UITableViewController {
    
    private lazy var habits = [Habit]()
    
    let persistance: PersistanceService = PersistanceService.shared

    @IBOutlet weak var newHabitButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myhabit = Habit(name: "Quit Smoking", type: .build, goal: Goal(period: .daily), note: "No more cigarette I swear")
        
        let myHabitProgress = HabitProgress()
        
        myhabit.addProgress(with: myHabitProgress)
        
        let myHabitData = try? JSONEncoder().encode(myhabit)
        
        print(String(data: myHabitData!, encoding: .utf8)!)
        
//        for i in 1...30 {
//            let habit: Habit = Habit(isNew: true)
//            habit.name = "Habit \(i)"
//            habit.createdAt = Date()
//
//            habits.append(habit)
//        }
        
        if let decodedHabit = try? JSONDecoder().decode(Habit.self, from: myHabitData!) {
            habits.append(decodedHabit)
        }
        
        self.tableView.reloadData()

    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        // ...
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let habit = habits[indexPath.row]
        cell.textLabel?.text = "\(String(describing: habit.name!))"
        cell.detailTextLabel?.text = "Created At \(String(describing: habit.createdAt))"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            habits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
}
