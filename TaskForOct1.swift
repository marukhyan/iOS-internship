/*
 Task 1
 Create a struct called Student which has 2 properties student name and grade. Create a class which has an array of Students and has method to add new student to this array, method to remove all students and method to print current list of students.
 */
print("Task 1\n")
struct Student {
    var name = ""
    var grade = ""
}

class University {
    var students: [Student] = []
    
    func newStudent(student: Student) {
        students.append(student)
    }
    
    func removeAllStudents() {
        students.removeAll()
        print("All students were deleted from base")
    }
    
    func printStudents() {
        if students.isEmpty {
            print("Empty list")
        }
        for stud in students {
            print("Name: \(stud.name) \tGrade: \(stud.grade) ")
        }
    }
}

var oxford = University()
var firstStudent = Student(name: "Davit Marukhyan", grade: "Master")
var secondStudent = Student(name: "Narek Sahakyan", grade: "Master")
oxford.newStudent(student: firstStudent)
oxford.newStudent(student: secondStudent)
oxford.printStudents()
oxford.removeAllStudents()
oxford.printStudents()
oxford.newStudent(student: secondStudent)
oxford.printStudents()

/*
 Task 2
 Create a class which has one Int property and one method which increment that property value. Experiment with self when accessing property.
 */
print("\nTask 2\n")
class Increment {
    var counter: Int = 0
    
    func increase() {
        self.counter += 1
    }
    
    func decrease() {
        self.counter -= 1
    }
    
    func toDeafultValue() {
        self.counter = 0
    }
}

var counter = Increment()
print(counter.counter)
counter.increase()
counter.increase()
print(counter.counter)
counter.decrease()
print(counter.counter)
counter.toDeafultValue()
print(counter.counter)

/*
 Task 3
 Create a struct which has 2 Int properties. Experiment with mutating keyword for struct's method which modifies that properties.
 */
print("\nTask 3\n")

struct Square {
    var x: Int
    var y: Int
    
    func Area() -> Int {
        return x * y
    }
    mutating func calcAreaFor(newx: Int, newy:Int) -> Int {
        self = Square(x: newx, y: newy)
        return x * y
    }
}

var newSquare = Square(x: 5, y: 6)
print("Area for square where X: \(newSquare.x), Y: \(newSquare.y) is \(newSquare.Area())")
print("New area is \(newSquare.calcAreaFor(newx: 10, newy: 8)), New X: \(newSquare.x), New Y: \(newSquare.y) ")

/*
 Task 4
 Create a class which has 2 Int properties. One of the properties should be static. Also create 2 methods and make one of them static. Experiment with static method non static property and static property non static method usage. Also experiment with static method and static property.
 */
print("\nTask 4\n")

class Game {
    static var bestPlayer = "Davit Marukhyan"
    static var highestLevel = 99
    var currentPlayer: String
    var currentlevel: Int = 0 {
        didSet {
            checkBestPlayer()
        }
    }
    
    init(player: String, level: Int) {
        currentlevel = level
        currentPlayer = player
        checkBestPlayer()
    }
    
    private func checkBestPlayer() {
        if currentlevel > Game.highestLevel {
            Game.highestLevel = currentlevel
            Game.bestPlayer = currentPlayer
        }
    }
    
    func printCurrentLevel() {
        print("Now you are on Level \(currentlevel)")
    }
    
    static func printBestScore() {
        print("Best player of the game is \(Game.bestPlayer) on Level \(Game.highestLevel)")
    }
}

var player = Game(player: "marukhya", level: 95)
player.printCurrentLevel()
Game.printBestScore()
player.currentlevel = 110
player.printCurrentLevel()
Game.printBestScore()
