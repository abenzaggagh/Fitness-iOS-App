//
//  HabitsViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/11/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

public protocol HabitDelegate {
    func addHabit(habit newHabit: Habit)
}

public protocol HabitCellDelegate {
    func openHabitDetails()
}

class HabitsViewContoller: UITableViewController {
    
    private lazy var habits = [Habit]()
    
    let persistance: PersistanceService = PersistanceService.shared

    @IBOutlet weak var newHabitButton: UIBarButtonItem!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerTableViewCells()
        
        self.habits = try! persistance.context.fetch(Habit.fetchRequest()) as! [Habit]
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "New Habit":
                if let destinationViewController = segue.destination as? HabitCreationViewController {
                    destinationViewController.modalPresentationStyle = .fullScreen
                    destinationViewController.habitdelegate = self
                }
            case "Habit Details":
                if let habit = sender as? Habit {
                    if let destinationViewController = segue.destination as? HabitDetailsViewController {
                        destinationViewController.habit = habit
                    }
                }
            default:
                break
            }
        }
    }
    
    @IBAction func newHabit(_ sender: UIBarButtonItem) {
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        // ...
    }
    
    func registerTableViewCells() {
        let habitTableViewCell = UINib(nibName: "HabitTableViewCell", bundle: nil)
        self.tableView.register(habitTableViewCell, forCellReuseIdentifier: "HabitTableViewCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HabitTableViewCell") as? HabitTableViewCell {
            let habit = habits[indexPath.row]
            cell.habitNameLabel?.text = "\(String(describing: habit.name!))"
            cell.habitProgressView.progress = 1.0
            return cell
        } else {
            let cell = UITableViewCell()
            let habit = habits[indexPath.row]
            cell.textLabel?.text = "\(String(describing: habit.name!))"
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let habit = habits[indexPath.row]
        performSegue(withIdentifier: "Habit Details", sender: habit)
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

extension HabitsViewContoller: HabitDelegate {

    func addHabit(habit newHabit: Habit) {
        habits.append(newHabit)
        self.tableView.reloadData()
    }

}
