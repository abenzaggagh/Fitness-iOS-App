//
//  HabitsViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/11/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit
import CoreData

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
        
        self.tableView.separatorStyle = .none
        self.tableView.allowsMultipleSelection = false
        self.tableView.allowsSelectionDuringEditing = false
        
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
            
            cell.habit = habit
            
            cell.habitNameLabel?.text = habit.name ?? ""
            cell.streakCount = habit.currentStreak
            
            var calendar = Calendar(identifier: .gregorian)
            calendar.timeZone = TimeZone(secondsFromGMT: 0)!
            
            switch habit.goalPeriod! {
            case "Daily":
                
                cell.progressCount = habit.currentGoal()
                
                if habit.goalFrequency >= habit.currentGoal() {
                    cell.markGoalCompleted.isCompleted()
                } else {
                    cell.markGoalCompleted.isNotCompleted()
                }
               
            case "Weekly":
                
                let startDate = calendar.startOfDay(for: Date.today().previous(.monday, considerToday: true))
                let endDate   = calendar.startOfDay(for: Date.today().next(    .sunday, considerToday: true))
    
                let todayProgress = NSFetchRequest<NSFetchRequestResult>(entityName: "Progress")
                todayProgress.predicate = NSPredicate(format: "progressHabit == %@ AND day >= %@ AND day <= %@", habit, startDate as NSDate, endDate as NSDate)
                
                do {
                    
                    let todayProgressResult = try persistance.context.fetch(todayProgress) as? [Progress]
                    
                    if let todayProgressResult = todayProgressResult {
                        cell.progressCount = todayProgressResult.count
                    }
                    
                } catch {
                    print(error)
                }
                
            case "Monthly":
                
                
                
                break
            case "Yearly":
                
                break
            default:
                break
            }
            
            return cell
            
        } else {
            
            let cell = UITableViewCell()
            let habit = habits[indexPath.row]
            
            cell.textLabel?.text = "\(String(describing: habit.name!))"
            
            return cell
            
        }
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Habit Details", sender: habits[indexPath.row])
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Display a confirmation message...
            
            tableView.beginUpdates()
            
            let habit = habits[indexPath.row]
            persistance.context.delete(habit)
            
            habits.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            tableView.endUpdates()
            
            persistance.save()
        }
    }
    
}
