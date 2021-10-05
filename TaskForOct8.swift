/*
 Task 1
 Create 2-3 classes. Create another class which has a method which can return instance of mentioned classes optionally. Also create instances of classes as a property for another class. Experiment a lot with different cases to understand optional chaining.
 */

class House {
    let numberOfRooms = 5
    let houseArea = HouseArea()
}

class Car {
    let name = "Nissan"
}

class HouseArea {
    let area = 120
}

class Person {
    var house: House?// = House()
    var car: Car? = Car()
    
    func printCarName() {
        if let name = car?.name {
            print ("Car name is \(name)")
        } else {
            print("This person doesn't have a car")
        }
    }
    
    func printHouseArea() {
        if let area = house?.houseArea.area {
            print("House area is \(area)")
        } else {
            print("House area doesn't initialized")
        }
    }
}

let men = Person()
men.printCarName()
men.printHouseArea()
