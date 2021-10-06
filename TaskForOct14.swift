/*
 Task 1
 Add extension to Int. Inside that extension add function named square which will return square of that number.
 
 */
print("Task 1\n")
extension Int {
    func square() -> Int {
        return self * self
    }
}

var number = 10
print(10.square())
/*
 Task 2
 Create a class named Example. Inside that class declare a property of type Int named age. Create an extension for Example class and add a function which will print the value of age.
 
 */
print("\nTask 2\n")

class Example {
    var age: Int
    init(age: Int) {
        self.age = age
    }
}

extension Example {
    func printAge() {
        print(age)
    }
}

var exam = Example(age: 15)
exam.printAge()
