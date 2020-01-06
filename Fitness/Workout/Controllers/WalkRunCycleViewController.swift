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
    
    var durationTimer: Timer! = nil
    var statusTimer: Bool? = false
    var duration = (hours: 0, minutes: 0, seconds: 0)
    var pedometer = CMPedometer()
    
    var stepsCount: Int = 0
    
    var distanceUnit: String?
    
    // MARK: - Outlets
    
    @IBOutlet var walkRunCycleView: UIView!
    @IBOutlet weak var gettingStartedView: UIView!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var distanceUnitLabel: UILabel!
    
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var paceLabel: UILabel!
    
    func getReady() {
        walkRunCycleView.addSubview(gettingStartedView)
        // TODO:
    }
    
    func setupUI() {
        distanceLabel.text = "0"
        durationLabel.text = String(format: "%.2d:%.2d:%.2d", duration.0, duration.1, duration.2)
        stepsLabel.text = "--°"
        caloriesLabel.text = "0"
        paceLabel.text = "-'--\""
        if let distanceUnit = distanceUnit {
            distanceUnitLabel.text = distanceUnit
        }
    }
    
    func setupPedometer() {
        if CMPedometer.isStepCountingAvailable() {
            pedometer.startUpdates(from: Date(), withHandler: { (pedometerData, error) in
                if let pedometerData = pedometerData {
                    DispatchQueue.main.async {
                        self.distanceLabel.text = "\(pedometerData.numberOfSteps)"
                        if pedometerData.currentPace == nil {
                            self.paceLabel.text = "-'--\""
                        } else {
                            self.paceLabel.text = "\(pedometerData.currentPace!)"
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
        
        let _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
            self.gettingStartedView.isHidden = true
            self.setupUI()
        }
        
        self.durationTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(durationCounter), userInfo: nil, repeats: true)
        
        setupPedometer()
        
    }
    
    @IBAction func endWorkoutButton(_ sender: UIButton) {
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

    
    
    
    
  
    
}
