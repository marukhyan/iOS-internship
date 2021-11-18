//
//  Building.swift
//  OOPHomeworkSwift
//
//  Created by David Marukhyan on 18.11.21.
//

import Foundation

class Building {
    var floors: [Floor]!
    var numberOfFloors: Int
    var numberOfApartments: Int
    
    init(numberOfFloors: Int, numberOfApartments: Int) {
        self.numberOfFloors = numberOfFloors
        self.numberOfApartments = numberOfApartments
        floors = Array(repeating: Floor(numberOfApartments: numberOfApartments), count: numberOfFloors)
        
    }
    
    func fireAlarm() {
        print("Alarm is on")
        elevator.isWorking = false
        for floor in floors {
            for apartment in floor.apartments {
                apartment.door.openDoor()
            }
        }
    }
}

extension Building: ElevatorDelegate {
    func turnOnLightOnThisFloor(number: Int) {
        self.floors[number].lightIsOn = true
        print("Light is On")
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(5), execute: {
            self.floors[number].lightIsOn = false
            print("Light is Off")
        })
    }
    
    
}

