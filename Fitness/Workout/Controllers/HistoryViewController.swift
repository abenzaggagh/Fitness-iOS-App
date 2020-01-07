//
//  HistoryViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/14/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit


class HistoryViewController: UITableViewController {
    
    var walks: [Walk]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCells()
        
        walks = try! persistance.context.fetch(Walk.fetchRequest()) as! [Walk]
        
    }
    
    func registerTableViewCells() {
        let workoutTableViewCell = UINib(nibName: "WorkoutWalkTableViewCell", bundle: nil)
        self.tableView.register(workoutTableViewCell, forCellReuseIdentifier: "WorkoutWalkTableViewCell")
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return walks.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutWalkTableViewCell") as? WorkoutWalkTableViewCell {
            
            let walk = walks[indexPath.row]
            
            cell.walk = walk
            
            return cell
        
        } else {
            
            return UITableViewCell()
        }
    }
        
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            performSegue(withIdentifier: "Walk Details", sender: walks[indexPath.row])
    }
        
        
        
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Display a confirmation message...
                
                tableView.beginUpdates()
                
                let walk = walks[indexPath.row]
                persistance.context.delete(walk)
                
                walks.remove(at: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
                tableView.endUpdates()
                
                persistance.save()
            
        }
    }
}
