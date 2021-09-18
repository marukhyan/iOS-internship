/*
 Task 1
 Create several variables(some should be constants some not). Do different arithmetic operations with them and print.
*/
var a = 5
let b: Double = 4
print("a = ", a)
var c = 8
a += 2
var d = a * c
let e = d / Int(b)
print ("a = ", a)
print ("b = ", b)
print ("c = ", c)
print ("d = ", d)
print ("e = ", e)

/*
Task 2
 Create typealias for Int or Double and use that alias. Understand the usage.
*/
typealias dble = Double
typealias inte = Int
var amb:inte = 8
var kotor:dble = 8
var amborig:Int = 10
var kotororig:Double = 10

print(amb)
print(kotor)
print(amborig)
print(kotororig)

/*
Task 3
 Create a tuple with 2 fields, one for name second for age. Initialize and print tuple values.
*/
var student = ("Davit",23)
var (name,age) = student
name="Narek"
print(name)
print(age)
print(student)
let (justname,_) = student
print(justname)

/*
Task 4 and 5
 Create optional variable and try to represent shops where there is a product, there is 0 amount of the product at this moment and product does not exists at all.
 Play with optional values, their binding and unwrapping.
*/
var optionalname:String? = nil
var greetings = "Hello"
if let name = optionalname {
    print ("\(greetings) \(optionalname)")
}

var banana: Int? = 10
if banana != nil {
    print("we have \(banana!) bananas")
}
else {
    print("We have not got that fruit")
}

/*
Task 6
 Play with asserts. Create cases and understand when it works.
*/


//var personage = -25
//assert(personage >= 0,"Person age must be bigger than 0")

var humanage = -19
if humanage >= 18 {
    print("You can drive a car")
} else if humanage >= 0 {
    print("Sorry you can't drive a car")
} else {
    assertionFailure("Your age is invalid")
}
