//
//  RunViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/14/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit
import CoreMotion
import CoreData


class WalkRunCycleViewController: UIViewController {
    
    var workoutType: WorkoutType?
    
    var startDate: Date!
    
    var durationTimer: Timer! = nil
    var statusTimer: Bool? = false
    var duration = (hours: 0, minutes: 0, seconds: 0)
    var pedometer = CMPedometer()
    
    var stepsCount: Int = 0
    
    var distanceUnit: String?
    
    // MARK: - Outlets
    
    @IBOutlet var walkRunCycleView: UIView!
    
    @IBOutlet weak var gettingStartedView: UIView!
    @IBOutlet weak var gettingReadyLabel: UILabel!
    
    var gettingReadyCount = 3
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var mainCountingParameterLabel: UILabel!
    @IBOutlet weak var mainCountingParameterUnitLabel: UILabel!
    
    @IBOutlet weak var secondaryCountingParameterTitleLabel: UILabel! // Walk: Distance | Run & Cycle: Steps
    @IBOutlet weak var secondaryCountingParameterUnitLabel: UILabel!
    @IBOutlet weak var secondaryCountingParameterLabel: UILabel!
    
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!

    let persistance = PersistanceService.shared
    
    func getReady() {
        
        gettingStartedView.frame = view.frame
        
        walkRunCycleView.addSubview(gettingStartedView)
        
        let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            DispatchQueue.main.async {
                self.gettingReadyLabel.text = "\(self.gettingReadyCount)"
            }
            
            self.gettingReadyCount = self.gettingReadyCount - 1
            
            if self.gettingReadyCount == 0 {
                DispatchQueue.main.async {
                    let font = UIFont.systemFont(ofSize: 96)
                    self.gettingReadyLabel.font = font
                    self.gettingReadyLabel.text = "Ready"
                }
            }
        }
        
        
        
    }
    
    func setupUI() {
        mainCountingParameterLabel.text = "0"
        durationLabel.text = String(format: "%.2d:%.2d:%.2d", duration.0, duration.1, duration.2)
        secondaryCountingParameterLabel.text = "----"
        caloriesLabel.text = "0"
        paceLabel.text = "-'--\""
        
        if let workoutType = workoutType {
            switch workoutType {
            case WorkoutType.Walk:
                walk()
            case WorkoutType.Run:
               run()
            case WorkoutType.Cycle:
                cycle()
            }
        }
        
        
    }
    
    func setupWalkPedometer() {
        if CMPedometer.isStepCountingAvailable() {
            pedometer.startUpdates(from: Date(), withHandler: { (pedometerData, error) in
                if let pedometerData = pedometerData {
                    DispatchQueue.main.async {
                        
                        self.mainCountingParameterLabel.text = "\(pedometerData.numberOfSteps)"
                        
                        if pedometerData.distance == nil {
                            self.secondaryCountingParameterLabel.text = "----"
                        } else {
                            self.secondaryCountingParameterLabel.text = "\(Int(truncating: pedometerData.distance!))"
                        }
                        
                        if pedometerData.currentPace == nil {
                            self.paceLabel.text = "-'--\""
                        } else {
                            if let currentCadence = pedometerData.currentCadence {
                                self.paceLabel.text = String(format:"%.02f", Float(truncating: currentCadence))
                            }
                        }
                        
                    }
                }
            })
        } else {
            print("Error")
        }
    }
    
    func setupRunPedometer() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startDate = Date()
        
        getReady()
                
        let _ = Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { timer in
            self.gettingStartedView.isHidden = true
            self.setupUI()
        }
        
        self.durationTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(durationCounter), userInfo: nil, repeats: true)
        
    }
    
    func saveWorkout() {
        
        if let workoutType = workoutType {
            switch workoutType {
            case WorkoutType.Walk:
                saveWalk()
            case WorkoutType.Run:
                saveRun()
            case WorkoutType.Cycle:
                saveCycle()
            }
        }
        
    }
    
    func saveWalk() {
        
        let endDate = Date()
        
        let entity = NSEntityDescription.entity(forEntityName: "Walk", in: persistance.context)!
        
        let walk = Walk(entity: entity, insertInto: persistance.context)
    
        pedometer.queryPedometerData(from: startDate!, to: endDate, withHandler: { (pedometerData, error) in
            if let pedometerData = pedometerData {
                
                walk.steps = Int32(truncating: pedometerData.numberOfSteps)
                
                walk.startDate = self.startDate!
                walk.endDate = endDate
            
                walk.distance = Float(truncating: pedometerData.distance ?? 0.0)
                
//                /walk.avgPace = pedometerData.averageActivePace!.stringValue
                
                walk.durationSeconds = Int16(self.duration.seconds)
                walk.durationMinutes = Int16(self.duration.minutes)
                walk.durationHours = Int16(self.duration.hours)
                
            }
        })
        
        persistance.save()
    }
    
    func saveRun() {
        
    }
    
    func saveCycle() {
        
    }
    
    @IBAction func endWorkoutButton(_ sender: UIButton) {
        // TODO: Change the whole fucking philosophy
        if sender.titleLabel?.text == "Pause" {
            self.durationTimer.invalidate()
            pedometer.stopUpdates()
            sender.titleLabel?.text = "Resume"
        } else if sender.titleLabel?.text == "Resume" {
            self.durationTimer.fire()
            sender.titleLabel?.text = "Pause"
        } else if sender.titleLabel?.text == "End" {
            self.dismiss(animated: true) {
                self.saveWorkout()
            }
        }
    }

    @objc func durationCounter() {
        
        duration.seconds += 1
        
        durationLabel.text = String(format: "%.2d:%.2d:%.2d",
                                    duration.hours,
                                    duration.minutes,
                                    duration.seconds)
        
        if duration.seconds == 60 {
            duration.seconds = 0
            duration.minutes += 1
        } else if duration.minutes == 60 {
            duration.minutes = 0
            duration.seconds += 1
        }
        
    }
    
    func walk() {
        // Set up the main counter as Steps counter and the second counter as distance counter
        mainCountingParameterUnitLabel.text = "Steps"
        
        secondaryCountingParameterUnitLabel.text = "Meters"
        secondaryCountingParameterTitleLabel.text = "Distance"
    
        setupWalkPedometer()
        
    }
    
    func run() {
        mainCountingParameterUnitLabel.text = "KM"
        
        secondaryCountingParameterTitleLabel.text = "Steps"
        
        
    }
    
    func cycle() {
        mainCountingParameterUnitLabel.text = "KM"
    }
  
    
}
