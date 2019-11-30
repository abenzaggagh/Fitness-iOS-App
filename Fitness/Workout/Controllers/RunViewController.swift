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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var pedomer = CMPedometer()

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
    
}
