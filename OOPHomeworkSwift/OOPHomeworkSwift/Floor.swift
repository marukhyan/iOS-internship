//
//  Floor.swift
//  OOPHomeworkSwift
//
//  Created by David Marukhyan on 18.11.21.
//

import Foundation

class Floor {
    var lightIsOn: Bool
    var apartments: [Apartment]!
    
    init(numberOfApartments: Int,lightIsOn: Bool = false) {
        self.lightIsOn = lightIsOn
        apartments = Array(repeating: Apartment(), count: numberOfApartments)
    }
}

