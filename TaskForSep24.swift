/*
Task 1
Create a function which gets string as a value and return the number of 'a' or 'A' symbols in it.
*/
print("Task 1\n")
func aAFinder (str: String) -> Int {
    var counter = 0
    for char in str {
        if char == "A" || char == "a" {
            counter += 1
        }
    }
    return counter
}
var name = "Arman Arakelyan"
print(aAFinder(str: name))
/*
Task 2
Modify function defined in the 1st point of the homework. Add new boolean parameter which will indicate should we calculate uppercase or lowercase 'a' symbol.
 */
print("\nTask 2\n")
func aAFinder (str: String, uppercase: Bool) -> Int {
    var counter = 0
    for char in str {
        if char == "A" && uppercase == true {
            counter += 1
        } else if char == "a" && uppercase == false{
            counter += 1
        }
    }
    return counter
}
print(aAFinder(str: name, uppercase: false))
 /*
Task 3
Modify 1st point of the homework. Add multiple return values to the function so it can return the number of 'a' and 'A' symbols separately.
 */
print("\nTask 3\n")
func aAFinder(for str: String) -> (a: Int, A: Int) {
    var counterFora = 0
    var counterForA = 0
    for char in str {
        switch char {
        case "A":
            counterForA += 1
        case "a":
            counterFora += 1
        default:
            continue
        }
    }
    return (counterForA,counterFora)
}
let aAResult = aAFinder(for: name)
print("We have \(aAResult.A) \"A\" and \(aAResult.a) \"a\"")

/*
Task 4
Experiment with argument labels and parameter names.
 */
print("\nTask 4\n")

func sqrt(for num: Int) -> Int {
    print("sqrt 1")
    return num * num
}
func sqrt(digit: Int) -> Int {
    print("sqrt 2")
    return digit * digit
}
func sqrt(num: Int) -> Int {
    print("sqrt 3")
    return num * num
}
print(sqrt(for: 5))
print(sqrt(digit: 7))
print(sqrt(num: 6))
/*

Task 5
Experiment with default parameter values.
 */
print("\nTask 5\n")

func circleArea(rad: Double, pi: Double = 3.14) -> Double {
    return pi * rad * rad
}
print("Circle area for 5 rad circle is \(circleArea(rad: 5))")
print("Circle area for 5 rad if pi = 3 is \(circleArea(rad: 5, pi: 3))")
 /*
Task 6
Write a function which has one in-out parameter of type string. Function must modify input parameter and remove all 'a' symbols. After calling the method print variable which was passed to the function.
 */
print("\nTask 6\n")

func aRemover(str: inout String) {
    var strWithouta = ""
    for char in str {
        if char != "a" {
            strWithouta.append(char)
        } else {
            continue
        }
    }
    str = strWithouta
}
var newStr = "Davit Marukhyan"
print(newStr)
aRemover(str: &newStr)
print(newStr)
 /*
Task 7
Define a function type which has 2 input int parameters and return an int. Create a function of that type and call it.
 */
print("\nTask 7\n")
func twoNumberSum(first x: Int, second y: Int) -> Int {
    return x + y
}
var mathFunction: (Int, Int) -> Int = twoNumberSum
print(mathFunction(3,4))
 /*
Task 8
Write a function which returns a function which compares 2 integers. Call first method to get comparator and later use comparator.
 */
print("\nTask 8\n")
func increaser(for x: Int) -> Int{
    let y = x + 1
    return  y
}
func deacreaser(for x: Int) -> Int {
    let y = x - 1
    return y
}
func mutator(increase: Bool) -> (Int) -> Int {
    increase ? increaser : deacreaser
}
var mathFunction2 = mutator(increase: true)
print(mathFunction2(5))
 /*
Task 9
Experiment with nested functions.
*/
print("\nTask 9\n")
func someMathOperations (for x: Int ) {
    func sqrt(for z: Int) -> Int {
        return z * z
    }
    func mult10(for z: Int) -> Int {
        return 10 * z
    }
    print("Sqrt for \(x) = \(sqrt(for: x))")
    print("10 * \(x) = \(mult10(for: x))")
}

someMathOperations(for: 5)
