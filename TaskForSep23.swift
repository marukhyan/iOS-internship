/*
 Task 1
 Create an array and experiment with for-in loops
 */
print("Task 1\n")
var newArray = [4, 5, 8, 9, 55]
var sum = 0
for num in newArray {
    sum += num
}
print("Sum of array members = \(sum)")

/*
 Task 2
 Create an array and experiment with while loops
  */
print("\nTask 2\n")
var nextArray = [1, 2, 3, 4, 5]
var counter = nextArray.count - 1
var multipl = 1
while counter > 0 {
    multipl *= nextArray[counter]
    counter -= 1
}
print("Multipl of array members = \(multipl)")

/*
 Task 3
 Create an array and count the number of elements which values are lower than 50 and which values are more than 50.
 
 */
print("\nTask 3\n")
var testArray = [10, 20, 30, 40, 50, 60, 70, 80]
var moreCounter = 0
var lessCounter = 0
for num in testArray {
    if num > 50 {
        moreCounter += 1
    } else {
        lessCounter += 1
    }
}
print("We have \(moreCounter) numbers which are bigger than 50 and \(lessCounter) numbers which are lower than 50")

/*
 Task 4
 Create an array and count number of elements which values are equal to 1 and 2 using switch statement
 */
print("\nTask 4\n")
var cuteArray = [1, 2, 3, 1, 1, 2, 3]
var oneCounter = 0
var twoCounter = 0
var other = 0
for num in cuteArray {
    switch num {
    case 1:
        oneCounter += 1
    case 2:
        twoCounter += 1
    default:
        other += 1
    }
}
print("We have \(oneCounter) \"1\", \(twoCounter) \"2\" and \(other) other numbers in our array")

/*
 Task 5
 Experiment with intervals in switch
 */
print("\nTask 5\n")
var bestArray = [5, 6, 7, 9, 10, 15, 19, 99, 110, 190, 5555]
var oneDigitNum = 0
var twoDigitNum = 0
var threeDigitNum = 0
for num in bestArray {
    switch num {
    case 1...9:
        oneDigitNum += 1
    case 10...99:
        twoDigitNum += 1
    case 100...999:
        threeDigitNum += 1
    default:
        continue
    }
}
print("We have \(oneDigitNum) numbers which have one digit, \(twoDigitNum) numbers which have two digits and \(threeDigitNum) numbers which have three numbers")

/*
 Task 6
 Experiment with control transfer statements
 */
print("\nTask 6\n")
var nameSurname = "Davit Marukhyan"
let vowels: [Character] = ["a", "e", "i", "o", "u"]
var nameWithoutVowels = ""
for char in nameSurname {
    if vowels.contains(char) {
        continue
    }
    nameWithoutVowels.append(char)
}

print("\(nameSurname) without vowels will be \(nameWithoutVowels)")

var firstVowel = 1
for char in nameSurname {
    if vowels.contains(char) {
        break
    } else {
        firstVowel += 1
    }
}

print("First vowel in you name \"\(nameSurname)\" is on index \(firstVowel)")
var myAge = 23
print("\(nameSurname) you age is \(myAge)")
switch myAge {
case 0..<18:
    print("You can't drive")
case 18..<99:
    print("You can drive")
    fallthrough
case 18..<99:
    print("You can smoke")
default:
    print("Are you a human ? :)")
}
