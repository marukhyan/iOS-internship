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
    private var isClosed: Bool
    
    init(isClosed: Bool = true) {
        self.isClosed = isClosed
    }
    
    func openDoor() {
        isClosed = false
        print("Door is opened")
    }
    
    func closeDoor() {
        isClosed = true
        print("Door is closed")
    }
}
