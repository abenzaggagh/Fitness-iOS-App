//
//  RunViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/14/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit
import CoreMotion

class RunViewController: UIViewController {
    
//    let durationTimer = Timer()
    var duration = (0,0,0)
    
    
    @IBOutlet weak var gettingStartedView: UIView!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // durationTimer.

        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        let _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
            self.gettingStartedView.isHidden = true
        }
    }
    
    @objc func timerAction() {
        duration.2 += 1
        if duration.2 == 100 {
            duration.2 = 0
            duration.1 += 1
        }
        if duration.1 == 60 {
            duration.1 = 0
            duration.0 += 1
        }
        
        durationLabel.text = "00:\(duration.0):\(duration.1).\(duration.2)"
    }
    
    var pedometer = CMPedometer()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func endRunWorkoutButton(_ sender: UIButton) {
        // _ard = UIStoryboard(name: "Workout", bundle: nil)
        // let workoutViewController = workoutStoryboard.instantiateViewController(withIdentifier: "Workout")
        // performSegue(withIdentifier: "End Workout", sender: nil)
        // workoutStoryboardpresent()
        self.dismiss(animated: false)
    }
    
    func timeString(from timeInterval: TimeInterval) -> String {
        let seconds = Int(timeInterval.truncatingRemainder(dividingBy: 60))
        let minutes = Int(timeInterval.truncatingRemainder(dividingBy: 60 * 60) / 60)
        let hours = Int(timeInterval / 3600)
        return String(format: "%.2d:%.2d:%.2d", hours, minutes, seconds)
    }
    
}
