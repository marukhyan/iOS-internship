/*
 Task 1
 Create one struct and one class to represent a person. Initialize fields of the class/struct via initializer in one case and via directly assigning values after creating the object in another case.
 
 */
print("Task 1")
struct StudentOne {
    var name = "Davit"
    var age = 23
    var location = "Yerevan"
}

class StudentTwo {
    var name = "Abgar"
    var age = 50
    var location = "Gyumri"
    
}

let firstStudent = StudentOne()
let secondStudent = StudentTwo()

let thirdStudent = StudentOne(name: "Levon", age: 20, location: "Ashtarak")
let forthStudent = StudentTwo()
forthStudent.age = 66
print(secondStudent.age)

/*
 Task 2
 Create a simple class which has only one member and experiment with === and !== operators.
 
 */
print("\nTask 2\n")
class FootballTeam {
    var valueOfClub = 100000000
}

var liverpoolFC = FootballTeam()
liverpoolFC.valueOfClub = 15000000
var barcelonaFC = FootballTeam()
barcelonaFC.valueOfClub = 20000000
var madridFC = barcelonaFC

if madridFC === barcelonaFC {
    print("Madrid FC and Barcelona FC are pointing to the same place")
}

if madridFC !== liverpoolFC {
    print("Madrid FC and Liverpool FC are not pointing to the same place")
}

print("Value of Barcelona FC = \(barcelonaFC.valueOfClub)")
print("Value of Madrid FC = \(madridFC.valueOfClub)")
print("Value of Liverpool FC = \(liverpoolFC.valueOfClub)")
