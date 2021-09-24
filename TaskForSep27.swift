/*
Task 1
 Create an array of strings. Then sort that array by calling .sorted(by: ...) method and provide your own sorting criteria. We will compare strings by their lengths to identify which one is bigger)
*/
print("Task 1\n")
var strArrayFor1 = ["Davit", "Moso", "Martin", "Davit", "Narek", "Armen"]
func size(s1: String, s2: String) -> Bool {
    return s1.count > s2.count
}
var res = strArrayFor1.sorted(by: size)
print(res)
/*
Task 2
 Create an array of strings and sort them by calling sorted(by: ...) method and provide < or > operator as a closure value(sort criteria). This example exists in the book.
*/
print("\nTask 2\n")
var strArrayFor2 = ["Artak","Babken","Aramayis", "Rob"]
var res2 = strArrayFor2.sorted(by: > )
print("Sorted array by >: \(res2)")
var res3 = strArrayFor2.sorted(by: < )
print("Sorted array by <: \(res3)")
/*
Task 3
 Create a function which receives 2 numbers as arguments and one closure which will be called with the sum value of provided 2 arguments. Your function should calculate the sum and then call closure with that calculated value.
*/
print("\nTask 3\n")
var closurePrint: (Int) -> (Void) = { value in
    print("The sum of two numbers is \(value)")
}
func func1(a: Int, b: Int,_ closure: (Int) -> (Void)) {
    closure(a + b)
}
func1(a: 5, b: 7, closurePrint)


/*
Task 4
 Prepare the scenario(just few sentence paragraph) where you will describe how and when escaping closures can be used.
*/
    
print("\nTask 4\n")

print("""
    Closures are reference types. Pass them into a function and you’re sharing a reference to
    the closure, it’s not copied. If we have a function that contains some asynchrony jobs,
    which must be or can be done separately and there is a possibility to finish the main job
    earlier than others, we must use escaping closures. An escaping closure is a closure that's
    called after the function it was passed to return. It outlives the function it was passed
    to. For example, if we are downloading some pictures or doing some work with the server
    which can be done separately from the main job. But if we are going to use closures after
    server response, those closures must be escaping. In another way that closures can be
    cleaned and dead after server back response:)
    
    """)

/* Some experiments */
print("\nSome experiments\n")

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementerby10 = makeIncrementer(forIncrement: 10)
let incrementerby102 = makeIncrementer(forIncrement: 10)
print(incrementerby10())
print(incrementerby10())
print(incrementerby10())
print(makeIncrementer(forIncrement: 10)())
print(incrementerby10())
print(incrementerby102())
print(incrementerby102())

