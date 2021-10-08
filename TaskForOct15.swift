/*
 Task 1
 Create a protocol named PersonInterface. Add 2 properties for first and last names. Add method named sayYourName which is not getting or returning any parameter. Write a class Person which will conform to PersonInterface protocol. Implement all properties and method defined in the protocol. Create instance of Person type, init first and last names. As an implementation for sayYourName just print first and last names. Call that method after you will create an object of type Person.
 
 Task 2
 Modify previous example and add an init method inside PersonInterface protocol. That init should get 2 string parameters for first and last names.
 
 Task 3
 Create FootballPlayer protocol and inherit it from PersonInterface protocol. Add clubName function to that protocol which is not getting or returning any parameter. Modify previous example so Person class will conform to FootballPlayer protocol. As an implementation for clubName just randomly print some football club name. Create instance of the Person class and call all methods defined in the protocol.
 
 
 */
//Task 1 and Task 2 and Task 3


//Protocols
protocol PersonInterface {
    var firstName: String {get}
    var lastName: String {get}
    func sayYourName()
    init(name: String, surname: String)
}

protocol FootballPlayer: PersonInterface {
    func clubName()
    
}

//Classes
class Person: FootballPlayer {
    let firstName: String
    let lastName: String
    
    func sayYourName() {
        print("My name is \(firstName) \(lastName)")
    }
    
    func clubName() {
        print("My club's name is Liverpool")
    }
    
    required init(name: String, surname: String) {
        firstName = name
        lastName = surname
    }
}

//Main part
let person = Person(name: "Davit", surname: "Marukhyan")
person.sayYourName()
person.clubName()


/*
 Task 4
 Experiment with class-only protocols. Try struct to conform to class-only protocol and see what's happening.
 */


//Protocol
protocol AnimalInterface: AnyObject {
    var type: String {set get}
    var numberOfLegs: Int {set get}
    func sound()
}

//Class
class Cat: AnimalInterface {
    var type: String = "Cat"
    var numberOfLegs: Int = 4
    
    func sound() {
        print("Meow :)")
    }
}

//Struct
//Non-class type 'Animal' cannot conform to class protocol 'AnimalInterface'
//struct Animal: AnimalInterface { //
//
//}


//Main part
let cat = Cat()
cat.sound()


/*
 Task 5
 Implement ClassRoom class which has addStudent method and Int property for current student count. Define protocol named ClassRoomDelegate and declare one method named studentAdded which has only 1 Int parameter named currentStudentCount. Define School class which conforms to ClassRoomDelegate protocol via extension. Inside School class add property named classroom which is of type ClassRoom. Add weak property for ClassRoom named delegate. For ClassRoom class addStudent method add the following implementation. When addStudent method called currentStudentCount should be incremented and you should call studentAdded method via delegate to distribute the current number of students. School implementation for studentAdded should print the number of students in the classroom. Create object of type School and then call addStudent method several times to see how you correctly print the number of students in the classroom.
 */
print("\nTask 5\n")
protocol ClassRoomDelegate: AnyObject {
    func studentAdded(currentStudentCount: Int)
}

class ClassRoom {
    var currentStudentCount = 0
    weak var delegate: ClassRoomDelegate?
    func addStudent() {
        currentStudentCount += 1
        delegate?.studentAdded(currentStudentCount: currentStudentCount)
    }
}

class School{
    var classroom: ClassRoom
    init(classroom: ClassRoom) {
        self.classroom = classroom
    }
}

extension School: ClassRoomDelegate {
    func studentAdded(currentStudentCount: Int) {
        print("Number of students is: \(currentStudentCount)")
    }
}


var classroom = ClassRoom()
var school = School(classroom: classroom)
classroom.delegate = school
classroom.addStudent()
classroom.addStudent()
classroom.addStudent()
classroom.addStudent()
