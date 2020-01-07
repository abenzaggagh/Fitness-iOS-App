//
//  CreateHabitsViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/15/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit

/// Habit Creation View Controller
/// View Controller for New Habit Creation
/// Modal View Controller
// TODO: Fix the Empty Habit Name Crashing the App
class HabitCreationViewController: UIViewController {

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

        let habit = Habit(entity: Habit.entity(), insertInto: persistance.context)

        if habitNameTextField.text != nil {

            if habitNameTextField.text!.isEmpty {

                habitNameTextField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 2.0, revert: true)

            } else {

                habit.name = habitNameTextField.text

                habit.type = Type(rawValue: habitTypeSegmentedControl.selectedSegmentIndex)?.description

                habit.goalPeriod = GoalPeriod(rawValue: goalPeriodSegementedControl.selectedSegmentIndex)?.description

                habit.goalFrequency = Int32(goalFrequencyStepper.value)

                habit.startDate = Date()

                habit.currentStreak = 0
                habit.longestStreak = 0

                self.dismiss(animated: true, completion: {
                    self.persistance.save()
                })

            }

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
        goalFrequencyStepper.maximumValue = 100

        let font = UIFont.systemFont(ofSize: 16)
        habitTypeSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)

    }

}





