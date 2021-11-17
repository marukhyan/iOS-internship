//
//  ViewController.swift
//  LocationTask
//
//  Created by David Marukhyan on 14.11.21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var startEndButton: UIButton!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var isStarted = false
    var startLocation: CLLocation!
    var traveledDistance: Double = 0
    var locationManager = CLLocationManager()
    var price: Int!
    var startTime: Date?
    var endTime: Date?
    var oldLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    @IBAction func setPrice(_ sender: Any) {
        if inputField.text == "" || Int(inputField.text!) == nil {
            errorLabel.text = "Enter Price"
        } else {
            errorLabel.text = ""
            price = Int(inputField.text!)
        }
    }
    
    @IBAction func startEndTrip(_ sender: Any) {
        if price != nil {
            errorLabel.text = ""
            if isStarted {
                endTrip()
            } else {
                startTrip()
            }
        } else {
            errorLabel.text = "Enter Price"
        }
    }
    
    func startTrip() {
        isStarted = true
        startTime = Date()
        startEndButton.backgroundColor = .systemRed
        traveledDistance = 0
        distanceLabel.text = "Distance"
        timeLabel.text = "Time"
        priceLabel.text = "Price"
        startEndButton.setTitle("End trip", for: .normal)
        oldLocation = locationManager.location
        locationManager.startUpdatingLocation()
    }
    
    func endTrip() {
        isStarted = false
        endTime = Date()
        startEndButton.backgroundColor = .systemGreen
        distanceLabel.text =
            String(format:"%.2f",Float(traveledDistance / 1000.0 + 0.005)) + " km"
        timeLabel.text = String(format:"%.2f",Double((endTime!.timeIntervalSince((startTime! as Date))))) + " sec"
        priceLabel.text = String(Int(ceil(traveledDistance / 1000.0)) * price) + " dram"
        startEndButton.setTitle("Start trip", for: .normal)
        startLocation = nil
        oldLocation = nil
        locationManager.stopUpdatingLocation()
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last, lastLocation.coordinate != oldLocation?.coordinate else { return }
        
        print("\ndidUpdateLocation \(lastLocation)") // To track movements by console
        
        if startLocation == nil {
            startLocation = lastLocation
        } else {
            let distance = startLocation.distance(from: lastLocation)
            traveledDistance += distance
            startLocation = lastLocation
        }
        
        oldLocation = nil
    }
}

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.longitude == rhs.longitude && lhs.latitude == rhs.latitude
    }
}
