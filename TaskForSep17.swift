/*
 Task 1
 Experiment with strings(also multiline)
 
 */
print("Task 1")
var name:String?
name = "Davit"
//name = "Narek"
switch name {
case "Davit":
    print("Hi Davit")
case "Narek":
    print("Hi Narek")
default:
    print("default case")
}
name = """
    My name is Davit
    I am 23 years old
    Nice to meet you :)
    """
print(name!)
/*
 Task 2
 Concatenating strings and string + character
 
 */
print("Task 2")
var userName = "marukhyan"
var gmail = "@gmail.com"
var simpleChar: Character = "!"
var resultOfSum = userName + String(simpleChar)
var resultOfMail = userName + gmail
print(resultOfSum)
print(resultOfMail
)
/*
 Task 3
 Use integral types inside string via string interpolation

 */
print("Task 3")
var temperatureInC  = 23
var temperatureInF: Double = Double(temperatureInC) * 9/5 + 32
print("Temperature today is \(temperatureInC)C or \(temperatureInF)F")

/*
 Task 4
 Experiment with isEmpty and count for string
 
 */
print("Task 4")
var customerName = "Davit"
if customerName.isEmpty {
    print("Please Enter your name")
} else {
    print("Hi \(customerName) your name has \(customerName.count) sumbols")
}

/*
 Task 5
 Experiment with indices

 */
print("Task 5")
var nameOfCar = "Nissan"
print(nameOfCar[nameOfCar.startIndex])
print(nameOfCar[nameOfCar.index(after: nameOfCar.startIndex)])
print(nameOfCar[nameOfCar.index(nameOfCar.startIndex, offsetBy: 2)])
print(nameOfCar[nameOfCar.index(nameOfCar.endIndex, offsetBy: -3)])
print(nameOfCar[nameOfCar.index(nameOfCar.endIndex, offsetBy: -2)])
print(nameOfCar[nameOfCar.index(before: nameOfCar.endIndex)])
print(nameOfCar)

/*
 Task 6
 Insert and remove with ranges
 
 */
print("Task 6")
var fullName = "Davit Marukhyan"
fullName.insert("!", at:fullName.endIndex )
fullName.insert(contentsOf: "\nNice to meet you", at: fullName.endIndex)
print(fullName)
let range = fullName.index(fullName.startIndex,offsetBy: 5)..<fullName.endIndex
fullName.removeSubrange(range)
print(fullName)

/*
 Task 7
 Experiment with prefixes and suffixes
 
 */
print("Task 7")
var userNames = ["Vahagn","Armen","Andranik","Armen","Arman","Abraham"]
var armCounter = 0
var nCounter = 0
for user in userNames {
    if user.hasPrefix("Arm") {
        armCounter += 1
    }
}
print("\(armCounter) names in userNames starts with \"Arm\"")
for user in userNames {
    if user.hasSuffix("n") {
        nCounter += 1
    }
}
print("\(nCounter) names in userNames ends with \"n\"")
/*
 Task 8
 Write a program which receives a string of first name and last name with format "F:Anthony L:Bialetti" where "F:" and "L:" are prefixes for first and last names. Program should return first name and last name via substring operations.
 
 */
print("Task 8")
var nameSurname = readLine()
print(nameSurname!)
var names = nameSurname!.split(separator: " ")
var nameofUser = names[0]
var surnameOfUser = names[1]
nameofUser.removeSubrange(nameofUser.startIndex..<nameofUser.index(nameofUser.startIndex,offsetBy: 2))
surnameOfUser.removeSubrange(surnameOfUser.startIndex..<surnameOfUser.index(surnameOfUser.startIndex,offsetBy: 2))
print(nameofUser)
print(surnameOfUser)

