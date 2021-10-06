/*
 Task 1
 Create class named Base which has one f method which prints text "Base f". Create Derived1 and Derived2 classes which are inherited from Base and override f function so for Derived1 it prints "Derived1 f" and for Derived2 it prints "Derived2 f". Create objects of classes Derived1 and Derived2 and experiment with as and is. Compare objects of Derived1 and Derived2 with each other and with Base via as and is.
 */
class Base {
    func f() {
        print("Base f")
    }
}

class Derived1: Base {
    override func f() {
        print("Derived1 f")
    }
}

class Derived2: Base {
    override func f() {
        print("Derived2 f")
    }
}

class Derived1Derived: Derived1 {
    override func f() {
        print("Derived1Derived f")
    }
}

var d1 = Derived1()
var d2 = Derived2()
var d3 = d1 as Base
var d4 = Derived1Derived()

if d3 is Derived1 {
    print("d3 is Derived1 type")
}

if d4 is Base {
    print("d4 is Base type")
}

if d1 is Derived2 {
    print("d1 is Derived2 type")
}


/*
 Task 2
 Using classed defined in the previous homework create an array of Base type. Insert some amount of Derived1 and Derived2 objects in that array. Then count the number of Derived1 and Derived2 objects in that array.
 */

var arr: [Base] = []
arr.append(d1)
arr.append(d2)
arr.append(d3)
arr.append(d4)

var counterForD1 = 0
var counterForD2 = 0

for member in arr {
    if member is Derived1 {
        counterForD1 += 1
    }
    if member is Derived2 {
        counterForD2 += 1
    }
}

print("We have \(counterForD1) Derived1 instances and \(counterForD2) Derived2 instances")
