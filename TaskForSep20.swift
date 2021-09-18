/*
Task 1
Create array and experiment with isEmpty, count, iterate over it's elements in different
ways and print values
 */
print("Task 1\n")
var someStrings: [String] = []
print("We have an array of Strings called \"someStrings\" with \(someStrings.count) members")
someStrings.isEmpty ? print("Please add some Strings \n") : print("What to do with them ?\n")

someStrings.append("Ibrahim")
print("We have added Ibrahim to array\n")

var someNames = ["David", "George", "Mickael", "Armen"]
var newStringArray = someStrings + someNames
print("We have created a new array from 2 arrays, let's say Hi to all members")
for name in newStringArray {
    print("Hi \(name)")
}

newStringArray.insert("Sargis", at: 0)
print("\nWe have added Sargis to array at first position")
for i in 0..<newStringArray.count {
    print(newStringArray[i])
}

print("\nWe have removed Mickael from array")
newStringArray.remove(at: 4)
for (index,value) in newStringArray.enumerated() {
    print("Name \(index + 1) is \(value)")
}
/*
Task 2
Create set and experiment with isEmpty, count, iterate over it's elements in different
ways and print values
 */
print("\nTask 2\n")
var someSet1 = Set<String>()
print("We have a set of Strings called \"someSet1\" with \(someSet1.count) members")
someSet1.isEmpty ? print("Please add some Strings \n") : print("What to do with them ?\n")


someSet1.insert("Davit")
someSet1.insert("Armen")
print("\nWe have added Davit and Armen to someSet1")
for name in someSet1 {
    print(name)
}

var someSet2: Set<String> = ["Armen", "Andranik", "Sahak", "Davit"]
print("\nWe have created a new someSet2 with sorted Strings")
for name in someSet2.sorted() {
    print(name)
}

print("\nIs someSet1 a subset of someSet2 ? :", terminator: " ")
someSet1.isSubset(of: someSet2) ? print("Yes") : print("No")

/*
Task 3
Write a program to concatenate 2 arrays and print final result
 */
print("\nTask 3\n")
var someInts1: [Int] = [1,2,3,5,6,7]
var someInts2: [Int] = [3,4,5,6,7,8]
var resultOfSum = someInts1 + someInts2

print("Our first Array :",terminator: "\t\t")
for int in someInts1 {
    print(int, terminator: " ")
}

print("\nOur second Array :",terminator: "\t\t")
for int in someInts2 {
    print(int, terminator: " ")
}

print("\nSome of two Arrays :",terminator: "\t")
for int in resultOfSum {
    print(int, terminator: " ")
}
 /*
Task 4
Write a program to get a set which is a intersection of 2 other sets
 */
print("\n\nTask 4\n")
print("Here is the first Set called \"someSet1\"")
someSet1.insert("Ibrahim")
for name in someSet1 {
    print(name)
}

print("\nHere is the second Set called \"someSet2\"")
for name in someSet2 {
    print(name)
}

print("\nHere is the final Set with intersection of 2 other sets")
var finalSet  = Set<String>()
finalSet = someSet1.union(someSet2)
for name in finalSet.sorted() {
    print(name)
}
/*
Task 5
Write a program to enter numbers and store them in a container but only unique
values.Duplicates are not allowed. If user enters a number which already in a
container program should print a text and inform user that entered number already
exists.
*/
print("\nTask 5\n")
var numbers: Set<Int> = []
var unit:Int? = Int(readLine()!)
repeat {
   numbers.insert(unit!)
   print(numbers.sorted())
   unit = Int(readLine()!)
} while !(numbers.contains(unit!))
if(numbers.contains(unit!)) {
   print("This number already exists")
}
