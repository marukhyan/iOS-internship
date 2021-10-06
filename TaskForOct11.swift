/*
 Task 1
 Create an enum which conforms to Error protocol. Define 2 error cases in that enum, one error case name should be outOfBounds, for second set name which you want.
 */

enum ArrayErrorList: Error {
    case outOfBounds
    case minusNumber
}

/*
 Task 2
 Write a function which can throw an error. Function should receive one index parameter and return Int value. Inside function create an array of Ints from 5 elements. Inside the function do checking and if index is out of range then throw outOfRange error defined in the enum. Otherwise return element for that index.
 */

func myFunction(index: Int) throws -> Int {
    let arr = [2, 3, -3, 5, 6]
    if index < 0 || index >= arr.count {
        throw ArrayErrorList.outOfBounds
    }
    if arr[index] < 0 {
        throw ArrayErrorList.minusNumber
    }
    return arr[index]
}

/*
 Task 3
 Write a code with do/catch blocks and inside do block throw second error defined in your enum. Handle it in your catch block and print appropriate message.
 */

do {
    try print(myFunction(index: 2))
} catch ArrayErrorList.outOfBounds {
    print("Out of Bounds")
} catch ArrayErrorList.minusNumber {
    print("Minus detected in array")
}
