//
//  Elevator.swift
//  OOPHomeworkSwift
//
//  Created by David Marukhyan on 18.11.21.
//

protocol ElevatorDelegate: AnyObject {
    func turnOnLightOnThisFloor(number: Int)
}

import Foundation

class Elevator {
    var isWorking = true
    var elevatorDoorsAreOpen = false
    weak var delegate: ElevatorDelegate?
    var floorNumber = 1
    func callElevator() {
        if isWorking {
            print("You have called the elevator")
            openDoor()
            print("Which floor do you want to go ?: ")
            floorNumber = Int(readLine()!)!
            goToThisFloor(number: floorNumber)
            closeDoor()
        } else {
            print("Elevators are turned off, Alarm mode is on")
        }
    }
    
    private func goToThisFloor(number: Int) {
        if isWorking {
            print("\nYou have arrived to \(number) floor")
            delegate?.turnOnLightOnThisFloor(number: number)
        }
    }
    
}

extension Elevator: Openable {
    func openDoor() {
        print("Elevator doors are open")
        elevatorDoorsAreOpen = true
    }
    
    func closeDoor() {
        print("Elevator doors are closed")
        elevatorDoorsAreOpen = false
    }
}
