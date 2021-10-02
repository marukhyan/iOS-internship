/*
 Task 1
 Create a struct named Person. Add some properties to define person. Implement initializer to init all properties of Person struct
 
 */
print("Task 1\n")

struct Person {
    var name: String
    var surname: String
    var age: Int
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
    func nameSurnameAge() {
        print(name , surname, "age: ", age)
    }
}

var person = Person(name: "Davit", surname: "Marukhyan", age: 23)
person.nameSurnameAge()

/*
 Task 2
 Create a Person2 struct which has 2 properties, age and name. Add 2 init methods. One should get 2 parameters to init age and name. Second init method should only get 1 parameter and init another parameter with some default value inside init.
 
 */
print("\nTask 2\n")

struct Person2 {
    var age: Int
    var name: String
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
    init(age: Int) {
        name = "Personaaa"
        self.age = age
    }
}
var person2 = Person2(age: 55)
var person22 = Person2(age: 40, name: "Abdul")
print("Name of person2 is : \(person2.name), age is : \(person2.age)")
print("Name of person22 is : \(person22.name), age is : \(person22.age)")


/*
 Task 3
 Create a class with 2 properties where one of them is optional. Add init method and experiment with the number of arguments init receives. Try to have init with 2 parameters then one. Understand why it's ok to have init with only one parameter (not for optional one).
 
 */
print("\nTask 3\n")
class FootballStadium {
    var capacity: Int
    var vipSeats: Int?
    init(capacity: Int, vipSeats: Int?) {
        self.capacity = capacity
        self.vipSeats = vipSeats
    }
    init(capacity: Int) {
        self.capacity = capacity
    }
    func printTotalNumberOfSeats() {
        vipSeats == nil ? print("Total number of seats is : \(capacity)") : print("Total number of seats is : \(capacity), \(vipSeats!) of them are VIP")
    }
    
}

var anfield = FootballStadium(capacity: 55000)
var etihad = FootballStadium(capacity: 70000, vipSeats: 5000)
anfield.printTotalNumberOfSeats()
etihad.printTotalNumberOfSeats()

/*
 Task 4
 Create a class with  initializer which can fail. Init should receive one Int argument. If number is less than 0 initializer should fail. If it's greater than or equal to zero initializer should init property of the class.
 */
 print("\nTask 4\n")
class Vehicle {
    var numberOfWheels: Int
    init?(numberOfWheels: Int) {
        if numberOfWheels < 0 {
            return nil
        }
        self.numberOfWheels = numberOfWheels
    }
}

var bycicle = Vehicle(numberOfWheels: 2)
var boat = Vehicle(numberOfWheels: -2)
if let checker = bycicle {
    print("Number of bycicle wheels is : \(checker.numberOfWheels)")
}
if let checker = boat {
    print("Number of boat wheels is : \(checker.numberOfWheels)")
} else {
    print("Init fails")
}

/*
 Task 5
 Define a Shape class which has one boolean property to indicate is shape 3D or not. Write an init for Shape class to initialize the only property it has. Write a Rectangle class and inherit it from Shape. Add init for rectangle to initialize its width and height properties. Also inside Rectangle's init call Shape's init and initialize it with correct value for 3D property.
 */
print("\nTask 5\n")

class Shape {
    var is3D: Bool
    init(is3D: Bool) {
        self.is3D = is3D
    }
}

class Rectangle: Shape {
    var width: Int
    var height: Int
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        super.init(is3D: false)
    }
}

var rect = Rectangle(width: 5, height: 6)
print("Rectangle properties are Width : \(rect.width)\tHeight : \(rect.height)\tis3D? : \(rect.is3D) ")
