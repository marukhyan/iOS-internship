import Foundation

/*
 Task 1
 Create a class which has only one property which is let. Create class instance and initialize that let property properly.
 */
print("Task 1\n")

class Student {
    let position: String
    
    init(position: String) {
        self.position = position
    }
}

var stud = Student(position: "Bachelor")
//var stud = Student(position: "Master") **** invalid redeclaration of 'stud'
print("Student has \(stud.position) degree")


/*
 Task 2
 Create a class which has one Int property. Write getter and setter for that property. Both getter and setter should print the text like "Setter called", "Getter called".
 */
print("\nTask 2\n")

class Square {
    var side: Double = 5
    var area: Double {
        get {
            print("Getter called")
            return side * side
        }
        set {
            print("Setter called")
            self.side = sqrt(newValue)
            print("You have changed the size of area \(area)")
        }
    }
}

let obj = Square()
obj.side = 10.0
print(obj.area)
obj.area = 10000
print(obj.side)
/*
 Task 3
 Create a class which has 2 Int properties and one read-only computed property. That property should return the sum of 2 Int properties. Create class instance and print the value of computed property.
 */
print("\nTask 3\n")
class MathFucntion {
    var x: Double
    var y: Double
    var z: Double {
        return (x + y) / 2
        }
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

var line = MathFucntion(x: 2, y: 6)
print("For X = \(line.x), Y = \(line.y) Z = \(line.z)")
//line.z = 6   *****Cannot assign to property: 'z' is a get-only property

/*
 Task 4
 Create a class which has one Int property. Use willSet and didSet to print the text to indicate that property is going to be changed.
 */
print("\nTask 4\n")
class Temperature {
    var cels: Int = 21 {
        willSet {
            print("You have changed the temperature from \(cels) to \(newValue)")
        }
        didSet {
            if cels > oldValue {
                print("It's become hotter")
            }
        }
    }
}

var newTemp = Temperature()
newTemp.cels = 35
newTemp.cels = 20
