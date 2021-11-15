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
    var startLocation:CLLocation!
    var traveledDistance:Double = 0
    var locationManager = CLLocationManager()
    var price:Int!
    var startTime: NSDate?
    var endTime: NSDate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
    }
    
    @IBAction func setPrice(_ sender: Any) {
        if inputField.text == "" {
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
                
                isStarted = false
                endTime = NSDate()
                startEndButton.backgroundColor = .systemGreen
                distanceLabel.text =
                    String(format:"%.2f",Float(traveledDistance / 1000.0 + 0.005)) + "km"
                timeLabel.text = String(format:"%.2f",Double((endTime!.timeIntervalSince((startTime! as Date)))))
                priceLabel.text = String(Int(ceil(traveledDistance / 1000.0)) * price)
                startEndButton.setTitle("Start trip", for: .normal)
                startLocation = nil
                
            } else {
                
                isStarted = true
                startTime = NSDate()
                startEndButton.backgroundColor = .systemRed
                traveledDistance = 0
                startEndButton.setTitle("End trip", for: .normal)
            }
        } else {
            errorLabel.text = "Enter Price"
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("didUpdateLocation \(locations.debugDescription)")//To track movements by console
        if startLocation == nil {
            startLocation = locations.last
        }
        
        let lastLocation = locations.last!
        let distance = startLocation.distance(from: lastLocation)
        traveledDistance += distance
        startLocation = lastLocation
    }
    
}
