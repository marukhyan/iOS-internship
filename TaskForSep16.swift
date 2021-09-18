/*
Task1
 Write condition but use ternary operator instead of if/else.
*/

var age = 10
age >= 18 ? print("You are adult") : print("You are not adult")

var hasbonus = true
var sallary = 500
var result = sallary + (hasbonus ? 300 : 0)
print("This month you have \(result)$")

var name = ""
//name = "Davit"
(name == "") ? print("Please enter your name") : print("Hello \(name)!!!")

/*
Task2
 Play with nil value and comparison operators for it.
*/

var a:Int?
var b = 10
a = 45
var c = a != nil ? a! : b
print(c)

var animaltype:String?
animaltype = "Cat"
animaltype != nil ? print("you have \(animaltype!)") : print("You don't have an animal")

/*
Task3
 Play with range operators.
*/
 
for i in 1...4 {
    print(i)
}

var members = ["Ashot","Armen","Andranik"]
var membercount = members.count
for y in 0..<membercount {
    print("Name of member \(y+1) is \(members[y]) ")
}

print("Last test")
for member in members[1...] {
    print(member)
}
