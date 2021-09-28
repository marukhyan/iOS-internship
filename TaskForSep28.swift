/*
 Task 1
 Create an enum for compass directions(north, east ...) and then use that enum in switch/case to print each direction for specific enum case. For instance print text can be in this format "Your direction is north".
*/
print("Task 1\n")
enum CompassDirection: CaseIterable {
    case north
    case east
    case south
    case west
}
var direction = CompassDirection.north
switch direction {
case .north:
    print("Your direction is north")
case .east:
    print("Your direction is east")
case .south:
    print("Your direction is south")
case .west:
    print("Your direction is west")
}

 /*
 For the created compass enum adapt CaseIterable protocol and print the number of cases in enum.
*/
print("\nTask 2\n")
print("The number of cases for Compass is \(CompassDirection.allCases.count)")
 /*
 Add changes to make compass enum support numbers. Assign int values to enum cases for instance 1 can be 1st value. Print int values for each case using rawValues.
*/
print("\nTask 3\n")
enum CompassDirectionTwo: Int {
    case north = 1
    case east
    case south
    case west
}

let northSide = CompassDirectionTwo.north.rawValue
let eastSide = CompassDirectionTwo(rawValue: 2)
let southSide = CompassDirectionTwo.south
let westSide = CompassDirectionTwo.west.rawValue

print("Value for North is \(northSide)")
print("Value for East is \(eastSide!.rawValue)")
print("Value for South is \(southSide.rawValue)")
print("Value for West is \(westSide)")
