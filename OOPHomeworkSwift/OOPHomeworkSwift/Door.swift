//
//  Door.swift
//  OOPHomeworkSwift
//
//  Created by David Marukhyan on 18.11.21.
//

import Foundation

protocol Openable {
    func openDoor()
    func closeDoor()
}

class Door: Openable {
    var isClosed: Bool
    
    init(isClosed: Bool = true) {
        self.isClosed = isClosed
    }
    
    func openDoor() {
        if !isClosed {
            print("Door is opened")
        } else {
            print("Door is locked you can't open the door")
        }
    }
    
    func closeDoor() {
        if !isClosed {
            print("Door is closed")
        } else {
            print("Door is locked you can't close the door again")
        }
    }
}
