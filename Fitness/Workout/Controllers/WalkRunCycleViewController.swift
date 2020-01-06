//
//  RunViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/14/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit
import CoreMotion


class WalkRunCycleViewController: UIViewController {
    
    var workoutType: WorkoutType?
    
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
    @IBOutlet weak var secondaryCountingParameterLabel: UILabel!
    
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!

    
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
                        
                        if pedometerData.currentPace == nil {
                            self.paceLabel.text = "-'--\""
                        } else {
                            if let currentPace = pedometerData.currentPace {
                                let intCurrentPace = Int(truncating: currentPace) * 10
                                let doubleCurrentPace = (Double(truncating: currentPace) - Double(intCurrentPace)) * 100
                                self.paceLabel.text = String(format: "%.2d'%.2d\"", intCurrentPace, doubleCurrentPace)
                            }
                        }
                        
                    }
                }
            })
        } else {
            print("Error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getReady()
        
        
        
        let _ = Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { timer in
            self.gettingStartedView.isHidden = true
            self.setupUI()
        }
        
        self.durationTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(durationCounter), userInfo: nil, repeats: true)
        
        setupWalkPedometer()
        
    }
    
    @IBAction func endWorkoutButton(_ sender: UIButton) {
        // TODO: Change the whole fucking philosophy
        if sender.titleLabel?.text == "Pause" {
            self.durationTimer.invalidate()
            sender.titleLabel?.text = "Resume"
        } else if sender.titleLabel?.text == "Resume" {
            self.durationTimer.fire()
            sender.titleLabel?.text = "Pause"
        } else if sender.titleLabel?.text == "End" {
            self.dismiss(animated: true)
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
        
        secondaryCountingParameterTitleLabel.text = "Distance"
        
    }
    
    func run() {
        mainCountingParameterUnitLabel.text = "KM"
        
        secondaryCountingParameterTitleLabel.text = "Steps"
    }
    
    func cycle() {
        mainCountingParameterUnitLabel.text = "KM"
        
    }
  
    
}
