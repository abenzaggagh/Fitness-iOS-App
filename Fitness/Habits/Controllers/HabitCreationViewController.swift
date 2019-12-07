//
//  CreateHabitsViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/15/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

// HabitCreationViewController
// View Controller for New Habit Creation
// Modal View Controller
class HabitCreationViewController: UIViewController {
    
    // private lazy var habit // Habit(isNew: true)
    
    var habitdelegate: HabitDelegate!
    
    @IBOutlet weak var newHabitScrollView: UIScrollView!
    @IBOutlet weak var newHabitContentView: UIView!
    
    @IBOutlet weak var habitTypeStackView: UIStackView!
    @IBOutlet weak var habitNameStackView: UIStackView!
    @IBOutlet weak var goalPeriodStackView: UIStackView!
    @IBOutlet weak var goalFrequencyStackView: UIStackView!
    @IBOutlet weak var goalDaysStackView: UIStackView!
    
    @IBOutlet weak var habitTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var habitNameTextField: UITextField!
    @IBOutlet weak var goalPeriodSegementedControl: UISegmentedControl!
    @IBOutlet weak var goalFrequencyTextField: UITextField!
    @IBOutlet weak var goalFrequencyStepper: UIStepper!
    
    @IBOutlet var goalTrackingDaysButtons: [FHDayButton]!
    
    let networking = NetworkService.shared
    let persistance = PersistanceService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    @IBAction func goalFrequencyChanged(_ sender: UIStepper) {
        let goalFrequencyValue = Int(goalFrequencyStepper.value)
        goalFrequencyTextField.text = String(goalFrequencyValue)
    }
    
    @IBAction func goalPeriodChanged(_ sender: UISegmentedControl) {
        switch goalPeriodSegementedControl.selectedSegmentIndex {
        case 0:
            if goalDaysStackView.isHidden {
                goalDaysStackView.isHidden = false
            }
        default:
            if !goalDaysStackView.isHidden {
                goalDaysStackView.isHidden = true
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true)
        
    }
    
    @IBAction func save(_ sender: Any) {
        
//        habit.type = Type(rawValue: habitTypeSegmentedControl.selectedSegmentIndex)
//
//        if habitNameTextField.text != nil, !habitNameTextField.text!.isEmpty {
//            habit.name = habitNameTextField.text
//        } else {
//            habitNameTextField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 2.0, revert: true)
//        }
//
//        let goalPeriod = GoalPeriod(rawValue: goalPeriodSegementedControl!.selectedSegmentIndex) ?? nil
//
//        let goalFrequency = Int(goalFrequencyStepper.value)
//        var trackingDays = DailyDays()
//
//        var goal = Goal(period: goalPeriod!, frequency: goalFrequency)
//
//        if goalPeriod == .daily {
//            for goalTrackingDaysButton in goalTrackingDaysButtons {
//                trackingDays.on(day: goalTrackingDaysButton.currentTitle!, is: goalTrackingDaysButton.isActive())
//            }
//            goal.setTracking(days: trackingDays)
//        }
//
//        habit.createdAt = Date()
//        
//        habitdelegate.addHabit(habit: habit)
        
        let habit = Habit(entity: Habit.entity(), insertInto: persistance.context)
        
        if habitNameTextField.text != nil, !habitNameTextField.text!.isEmpty {
            
            habit.name = habitNameTextField.text // as! String
            habit.type = Type(rawValue: habitTypeSegmentedControl.selectedSegmentIndex)?.description
            
            persistance.save()
            
            self.dismiss(animated: true, completion: nil)
            
        } else {
            habitNameTextField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 2.0, revert: true)
        }
        
    }
    
     
    private func setupUI() {
    
        newHabitScrollView.addSubview(newHabitContentView)
        
        newHabitScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        newHabitContentView.topAnchor.constraint(equalTo: newHabitScrollView.topAnchor).isActive = true
        newHabitContentView.leadingAnchor.constraint(equalTo: newHabitScrollView.leadingAnchor).isActive = true
        newHabitContentView.trailingAnchor.constraint(equalTo: newHabitScrollView.trailingAnchor).isActive = true
        newHabitContentView.bottomAnchor.constraint(equalTo: newHabitScrollView.bottomAnchor).isActive = true
            
        newHabitContentView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        goalFrequencyStepper.value = 1
        goalFrequencyStepper.minimumValue = 1
        goalFrequencyStepper.maximumValue = 24
        
    }
    
}




extension UITextField {
    
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
        
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        
        animation.fromValue = baseColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        
        if revert {
            animation.autoreverses = true
        } else {
            animation.autoreverses = false
        }
        
        self.layer.add(animation, forKey: "")

        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        
        shake.duration = 0.07
        shake.repeatCount = shakes
        
        if revert {
            shake.autoreverses = true
        } else {
            shake.autoreverses = false
        }
        
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        
        self.layer.add(shake, forKey: "position")
        
    }
    
}
