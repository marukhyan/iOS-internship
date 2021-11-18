//
//  main.swift
//  OOPHomeworkSwift
//
//  Created by David Marukhyan on 18.11.21.
//

import Foundation

var userCommand: String!
print("""
    Hello and welcome to our Building simulator,
    Firstly please enter count of floors for out building here :
    """)
var numOfFloors = Int(readLine()!)

print("""
    
    Great!!!, our building will have \(numOfFloors!) floors!!!,
    How many apartments do you want in each floor ? :
    """)
var numOfApartments = Int(readLine()!)

var building = Building(numberOfFloors: numOfFloors!, numberOfApartments: numOfApartments!)
var elevator = Elevator()
elevator.delegate = building
var currentFloor = 1
print("""
    
    Looks Good :)
    We have created a building with \(numOfFloors!) floors and \(numOfApartments!) apartments!!!
    Now we are on \(currentFloor) floor
    """)

while userCommand != "Exit" {
    print("""

We can do following things here
1 - Go to another floor with elevator
2 - Check doors in \(elevator.floorNumber) floor
3 - Turn on Alarm
Or type "Exit" for exit

""")
    userCommand = readLine()
    
    switch userCommand {
    case "1":
        elevator.callElevator()
    case "2":
        print("Which aparment you want to check ?: ")
        let apartmentNumber = Int(readLine()!)!
        building.floors[currentFloor].apartments[apartmentNumber].door.openDoor()
    case "3":
        building.fireAlarm()
    case "Exit":
        break
    default:
        print("Please repeat your choice")
    }
    
}

