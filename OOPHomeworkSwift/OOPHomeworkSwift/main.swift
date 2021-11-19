//
//  main.swift
//  OOPHomeworkSwift
//
//  Created by David Marukhyan on 18.11.21.
//

let commandEngine = CommandEngine()
let (numOfFloors, numOfApartments) = commandEngine.getBuildingParams()
let building = Building(numberOfFloors: numOfFloors, numberOfApartments: numOfApartments)
var userCommand = ""
print("Building has been built")

while userCommand != "Exit" {
    userCommand = commandEngine.getUserChoiceForNextStep()
    switch userCommand {
    case "1":
        let floorNumber = commandEngine.getWantedFloorForElevator()
        building.useElevator(floorNumber: floorNumber)
    case "2":
        let apartmentNumber = commandEngine.getWantedApartmentToCheckDoor()
        building.floors[building.elevator.currentFloor].apartments[apartmentNumber].door.tryToOpen()
    case "3":
        building.fireAlarm()
    case "Exit":
        break
    default:
        print("Please repeat your choice")
    }
}
