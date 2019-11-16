//
//  CreateHabitsViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/15/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

class CreateHabitsViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var habitBuildQuitController: UISegmentedControl!
    
    @IBOutlet weak var habitNameTextField: UITextField!
    @IBOutlet weak var habitNameIdeasButton: UIButton!
    
    @IBOutlet weak var countTextField: UITextField!
    @IBOutlet weak var countStepper: UIStepper!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Change this generic button to custon class ui button
        habitNameIdeasButton.layer.cornerRadius = 8
        
        
        
        
        
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        
        let destroyAction = UIAlertAction(title: "Delete Habit",
                  style: .destructive) { (action) in
                    self.dismiss(animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                  style: .cancel) { (action) in
         // Respond to user selection of the action
        }
             
        let alert = UIAlertController(title: "Cancel Habit",
                    message: "Do you want to cancel the Habit?",
                    preferredStyle: .actionSheet)
        alert.addAction(destroyAction)
        alert.addAction(cancelAction)
             
        // On iPad, action sheets must be presented from a popover.
        alert.popoverPresentationController?.barButtonItem =
                    self.cancelButton
             
        self.present(alert, animated: true) {
            
        }
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func changeHabitSegmentedControl(_ sender: UISegmentedControl) {
        switch habitBuildQuitController.selectedSegmentIndex {
            case 0: break
                    
            case 1: break
                    
            default: break
                
        }
    }
    
    @IBAction func countStepperValueChanged(_ sender: UIStepper) {
        
    }
}
