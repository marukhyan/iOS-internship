//
//  Elevator.swift
//  OOPHomeworkSwift
//
//  Created by David Marukhyan on 18.11.21.
//

protocol ElevatorDelegate: AnyObject {
    func turnOnLightOnThisFloor(number: Int)
}

final class Elevator {
    var isWorking = true
    var door = Door(isLocked: false)
    var currentFloor = 1
    weak var delegate: ElevatorDelegate?
    
    func callElevator(goToFloor floorNumber: Int) {
        if isWorking {
            openDoor()
            goToThisFloor(number: floorNumber)
            currentFloor = floorNumber
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
    }
    
    func closeDoor() {
        print("Elevator doors are closed")
    }
}
