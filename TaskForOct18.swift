/*
 Task 1
 Write a generic method named compare. It should get 2 generic parameters and compare them. Define an enum which has 3 cases less, greater, equal. compare method should return that enum's case as a result.
 */
print("Task 1\n")

// Enum definition
enum Compare {
    case less
    case greater
    case equal
}

// Compare Function
func compareFirst<T: Comparable>(param1: T, param2: T) -> Compare {
    if param1 > param2 {
        return Compare.greater
    } else if param1 < param2 {
        return Compare.less
    } return Compare.equal
}

// Function usage
print(compareFirst(param1: 5, param2: 8))

/*
 Task 2
 Extend previous example and create a class named Person which has age and weight properties. Define <, > and equal operators. Create 2 instances of Person class and call compare method and print results.
 */
print("\nTask 2\n")


// Person class creation
class Person: Comparable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.age == rhs.age
    }
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age < rhs.age
    }
    static func > (lhs: Person, rhs: Person) -> Bool {
        return lhs.age > rhs.age
    }
    
    let age: Int
    let weight: Int
    
    init(age: Int, weight: Int) {
        self.age = age
        self.weight = weight
    }
}

// Using compare function with Person class
let person1 = Person(age: 55, weight: 66)
let person2 = Person(age: 66, weight: 55)
print(compare(param1: person1, param2: person2))

/*
 Task 3
 Extend pervious example to add type constraint syntax. After your changes compare method should work only with class types and does not work for Int, String, Double etc.
 */

// compare function midification
print("\nTask 3\n")
func compare<T: Comparable>(param1: T, param2: T) -> Compare where T: AnyObject {
    if param1 > param2 {
        return Compare.greater
    } else if param1 < param2 {
        return Compare.less
    } return Compare.equal
}

// New class which doesn't confirm to Comparable protocol
class SimplePerson {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


let person3 = SimplePerson(name: "Davit", age: 24)
let person4 = SimplePerson(name: "Abgar", age: 29)
//compare(param1: person4, param2: person3) -> person3 & 4 doesn't confirm comparable protocol

/*
 Task 4
 Define a generic class named Multiplicator. Declare 2 properties inside it and init them via initializer. Define multiply method which should return the result of multiplication of the defined 2 properties.
 */

print("\nTask 4\n")

// Multiplicator class deginition
class Multiplicator<Element: Numeric> {
    let x: Element
    let y: Element
    
    init(x: Element, y: Element) {
        self.x = x
        self.y = y
    }
    
    func multiply() -> Element {
        return x * y
    }
}

// multiply method usage
let multipl = Multiplicator(x: 5.5, y: 6.5)
print(multipl.multiply())

