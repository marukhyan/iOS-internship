import Foundation
/*
 Task 1
 Write a class named MyArray. MyArray should have a property of type [Int]. Initialize that property with some values. Then implement subscript for MyArray which in action should just return element from array property.
 */
print("Task 1\n")
class MyClass {
    var counter: Int
    var myArray: [Int] = []
    init(counter: Int) {
        self.counter = counter
        myArray = [Int](repeating: 1, count: counter)
    }
    subscript(index: Int) -> Int {
        get {
            return myArray[index]
        }
    }
}

var testClass = MyClass(counter: 8)
print(testClass[5])
/*
 Task 2
 Add Matrix class which will receive rows and columns count. Implement subscript operation for Matrix.
 */
print("\nTask 2\n")

class Matrix {
    var row: Int
    var column: Int
    var matrix: [Int]
    
    init(row: Int, column: Int) {
        self.row = row
        self.column = column
        matrix = Array(repeating: 1, count: row * column)
    }
    func validIndex(row: Int, column: Int) -> (Bool) {
        return row < self.row && row >= 0 && column < self.column && column > 0
    }
    
    subscript(row: Int, column: Int) -> Int {
        get {
            assert(validIndex(row: row, column: column), "Out of range")
            return matrix[(row * self.column) + column]
        }
        set {
            assert(validIndex(row: row, column: column), "Out of range")
            matrix[(row * self.column) + column] = newValue
        }
    }
}

var testMatrix = Matrix(row: 5, column: 5)
print(testMatrix[4, 4])
testMatrix[4, 4] = 5
print(testMatrix[4, 4])
//testMatrix[-1, 3]
