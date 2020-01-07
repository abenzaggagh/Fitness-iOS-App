//
//  WorkoutViewController.swift
//  Fitness
//
//  Created by Amine BEN ZAGGAGH on 11/13/19.
//  Copyright © 2019 Amine BEN ZAGGAGH. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class WorkoutNavigationController: UINavigationController {
    
}

enum WorkoutType: Int {
    case Walk = 0, Run, Cycle
}


class WorkoutViewController: UIViewController, CLLocationManagerDelegate {
    
    fileprivate let locationManager: CLLocationManager = CLLocationManager()
    
    @IBOutlet weak var workoutWeatherView: UIImageView!
    
    @IBOutlet weak var workoutToolbar: UIToolbar!
    @IBOutlet weak var workoutSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var workoutRunMap: MKMapView!
    
    @IBOutlet weak var startWorkoutButton: UIButton!
    
    var distanceUnit: String? = "Steps"
    
    var workout: WorkoutType? = WorkoutType.Walk
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupMapUI()
        setupWeatherUI()
        setupLocationManager()
        
        walk()
        
    }
    
    private func setupUI() {
        
        startWorkoutButton.layer.cornerRadius = 8
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let font = UIFont.systemFont(ofSize: 16)
        
        workoutSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        
        workoutToolbar.clipsToBounds = true
    }
    
    private func setupMapUI() {
        workoutRunMap.isZoomEnabled = false
        workoutRunMap.isPitchEnabled = false
        workoutRunMap.isRotateEnabled = false
        workoutRunMap.isScrollEnabled = false
        workoutRunMap.showsUserLocation = true
        workoutRunMap.layer.cornerRadius = 8
    }
    
    private func setupWeatherUI() {
        // TODO: Get user's location and update the weather regarding the location
        // TODO: Add Shadow to ImageView
//        workoutWeatherView.layer.shadowColor = UIColor.black.cgColor
//        workoutWeatherView.layer.shadowOffset = CGSize(width: 0, height: 20)
//        workoutWeatherView.layer.shadowOpacity = 1
//        workoutWeatherView.applyshadowWithCorner(containerView: workoutWeatherView, cornerRadious: 0.5)
        
        
    }
    
    private func setupLocationManager() {
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
        
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }

        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 600, longitudinalMeters: 600)
            workoutRunMap.setRegion(viewRegion, animated: false)
        }
    }
    
    @IBAction func changeWorkoutSegmentedControl(_ sender: UISegmentedControl) {
        switch workoutSegmentedControl.selectedSegmentIndex {
        case 0:
            walk()
        case 1:
            run()
        case 2:
            cycle()
        default:
            walk()
        }
    }
    
    private func walk() {
        workoutRunMap.isHidden = false
        distanceUnit = "Steps"
        
    }
    
    private func run() {
        workoutRunMap.isHidden = false
        distanceUnit = "KM"
    }
    
    private func cycle() {
        distanceUnit = "KM"
    }
    
    
    // MARK: - Segue
    @IBAction func startWorkout(_ sender: UIButton) {
        print("Start Workout")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "Start Workout":
                if let destinationViewController = segue.destination as? WalkRunCycleViewController {
                    destinationViewController.modalPresentationStyle = .fullScreen
                    if let distanceUnit = distanceUnit {
                        destinationViewController.distanceUnit = distanceUnit
                        switch workoutSegmentedControl.selectedSegmentIndex {
                        case 0:
                            destinationViewController.workoutType = WorkoutType.Walk
                        case 1:
                            destinationViewController.workoutType = WorkoutType.Run
                        case 2:
                            destinationViewController.workoutType = WorkoutType.Cycle
                        default:
                            destinationViewController.workoutType = WorkoutType.Walk
                        }
                    }
                }
            default:
                break
            }
        }
    }
    

    
}

