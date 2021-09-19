/*
Task 1
 Create a phonebook, dictionary with name and phone number.
 */
print("Task 1\n")

var phoneBook = [
    "Davit": 77873872,
    "Artak": 77887788,
    "Lavrent": 93776655,
    "Sahak": 77987987,
]
for (name,phone) in phoneBook {
    print("Phone number for \(name) is \(phone) ")
}

/*
Task 2
 Create a program where user enter names and at the end program prints the name and number of the count how much times that name was entered.
 */
print("\nTask 2\n")
print("Please enter first name: ", terminator: " ")
var name = readLine()!
var nameList: [String: Int] = [:]
nameList[name] = 1
while true {
    print("""
        \nPlease enter one more name if you want to continue
        Enter 0 if you want to exit\n
        """)
    name = readLine()!
    if name == "0" {
        break
    } else if nameList[name] == nil {
        nameList[name] = 1
    } else {
        nameList[name]! += 1
    }
}
for (name,count) in nameList {
    print("We have \(count) \(name)")
}




