//
//  Door.swift
//  OOPHomeworkSwift
//
//  Created by David Marukhyan on 18.11.21.
//

protocol Openable {
    func openDoor()
    func closeDoor()
}

final class Door: Openable {
    private(set) var isLocked = true
    
    init(isLocked: Bool = true) {
        self.isLocked = isLocked
    }
    
    func tryToOpen() {
        if isLocked {
            print("Door is locked we can't open the door")
        } else {
            print("Door is open, Welcome :)")
        }
    }
    
    func openDoor() {
        isLocked = false
    }
    
    func closeDoor() {
        isLocked = true
    }
}
