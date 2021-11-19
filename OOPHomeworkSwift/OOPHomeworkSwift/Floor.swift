//
//  Floor.swift
//  OOPHomeworkSwift
//
//  Created by David Marukhyan on 18.11.21.
//

final class Floor {
    var lightIsOn: Bool
    var apartments: [Apartment]
    
    init(numberOfApartments: Int, lightIsOn: Bool = false) {
        self.lightIsOn = lightIsOn
        self.apartments = Array(repeating: Apartment(), count: numberOfApartments)
    }
    
}

