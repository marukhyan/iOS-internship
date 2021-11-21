//
//  Building.swift
//  OOPHomeworkSwift
//
//  Created by David Marukhyan on 18.11.21.
//

import Foundation

final class Building {
    var floors: [Floor]
    var elevator = Elevator()
    
    init(numberOfFloors: Int, numberOfApartments: Int) {
        self.floors = Array(repeating: Floor(numberOfApartments: numberOfApartments), count: numberOfFloors)
        elevator.delegate = self
    }
    
    func useElevator(floorNumber: Int) {
        elevator.callElevator(goToFloor: floorNumber)
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
    
    func turnOnlightOnFloor(number: Int) {
        floors[number].lightIsOn = true
        print("Light is On")
    }
    
    func turnOfflightOnFloor(number: Int) {
        floors[number].lightIsOn = false
        print("Light is Off")
    }
    
}

extension Building: ElevatorDelegate {
    func turnOnLightOnThisFloor(number: Int) {
        self.turnOnlightOnFloor(number: number)
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(5), execute: {
            self.turnOfflightOnFloor(number: number)
        })
    }
    
    
}

