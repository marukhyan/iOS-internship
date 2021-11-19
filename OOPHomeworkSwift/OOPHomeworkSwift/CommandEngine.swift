//
//  CommandEngine.swift
//  OOPHomeworkSwift
//
//  Created by David Marukhyan on 19.11.21.
//

final class CommandEngine {
    
    var userCommand: String!
    
    func getBuildingParams() -> (Int,Int) {
        print("""
            Hello and welcome to our Building simulator,
            Firstly please enter count of floors for out building here :
            
            """)
        let numOfFloors = Int(readLine()!)
        
        print("""
            
            Great!!!, our building will have \(numOfFloors!) floors!!!,
            How many apartments do you want in each floor ? :
            
            """)
        let numOfApartments = Int(readLine()!)
        return (numOfFloors!,numOfApartments!)
    }
    
    func getWantedFloorForElevator() -> Int {
        print("Which floor do you want to go ?: ")
        let floorNumber = Int(readLine()!)!
        return floorNumber
    }
    
    func getWantedApartmentToCheckDoor() -> Int {
        print("Which aparment you want to check ?: ")
        let apartmentNumber = Int(readLine()!)!
        return apartmentNumber
    }
    
    func getUserChoiceForNextStep() -> String {
        print("""
        
        We can do following things here
        1 - Go to another floor with elevator
        2 - Check doors in \(building.elevator.currentFloor) floor
        3 - Turn on Alarm
        Or type "Exit" for exit
        
        """)
        userCommand = readLine()
        return userCommand
    }
    
}
