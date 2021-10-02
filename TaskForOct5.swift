import Foundation

/*
 Task 1
 Define a base class named Shape. Shape class should have a boolean property to indicate is shape 3 dimensional or not. Define a Square, Rectangle and Cube classes and inherit them from Shape. For each new class set correct value for the property to indicate is class 3 dimensional or not.
 
 Task 2
 Extend previous example. Add a method to Shape class and name it describe. Describe method should print  specifications for each shape. For Shape class it should print just the value of the property which indicates is shape 3D or not. Add new properties for Square, Rectangle and Cube. For Square add width, for Cube add width, length, height and for Rectangle add width and height. Override describe method for each one to print full list of properties.
 */
print("Task 1 and Task 2\n")

class Shape {
    var isThreeDimenshional: Bool
    init(isThreeDimenshional: Bool) {
        self.isThreeDimenshional = isThreeDimenshional
    }
    func describe() {
        print("Is three Dimensional ? : \(isThreeDimenshional)")
    }
}

class Square: Shape {
    var width: Int
    init(width: Int) {
        self.width = width
        super.init(isThreeDimenshional: false)
    }
    override func describe() {
        print("Width for this Square is : \(width)\n")
    }
}

class Rectangle: Shape {
    var width: Int
    var lenght: Int
    init(width: Int, lenght: Int) {
        self.width = width
        self.lenght = lenght
        super.init(isThreeDimenshional: false)
    }
    override func describe() {
        print("Width for this Rectangle is : \(width)")
        print("Lenght for this Rectangle is : \(lenght)\n")
    }
}

class Cube: Shape {
    var width: Int
    var lenght: Int
    var height: Int
    
    init(width: Int, lenght: Int, height: Int) {
        self.width = width
        self.lenght = lenght
        self.height = height
        super.init(isThreeDimenshional: true)
    }
    override func describe() {
        print("Width for this Cube is : \(width)")
        print("Lenght for this Cube is : \(lenght)")
        print("Height for this Cube is : \(height)\n")

    }
}

var square = Square(width: 5)
var rectangle = Rectangle(width: 6, lenght: 7)
var cube = Cube(width: 8, lenght: 9, height: 10)
print("Is Square a 3 dimensional ? : \(square.isThreeDimenshional)")
print("Is Rectangle a 3 dimensional ? : \(rectangle.isThreeDimenshional)")
print("Is Cube a 3 dimensional ? : \(cube.isThreeDimenshional)\n")
square.describe()
rectangle.describe()
cube.describe()
/*
 Task 3
 Experiment with property overriding and final keyword.
 */
print("\nTask 3\n")

class Triangle: Shape {
    var aSide: Int
    var bSide: Int
    var cSide: Int
    init(aSide: Int, bSide: Int, cSide: Int) {
        self.aSide = aSide
        self.bSide = bSide
        self.cSide = cSide
        super.init(isThreeDimenshional: false)
    }
    final func calculateAreaByHeroFormula() -> Double {
        let halfPerimeter: Double = Double((aSide + bSide + cSide) / 2)
        let expr = halfPerimeter * (halfPerimeter - Double(aSide)) * (halfPerimeter - Double(bSide)) * (halfPerimeter - Double(cSide))
        return sqrt(expr)
    }
}

var triangle = Triangle(aSide: 8, bSide: 11, cSide: 13)
print("Area for Triangle is where a = \(triangle.aSide), b = \(triangle.bSide), c = \(triangle.cSide): \(triangle.calculateAreaByHeroFormula())")

class EquilateralTriangle: Triangle {
    init(side: Int) {
        super.init(aSide: side, bSide: side, cSide: side)
    }
    func calculateArea() -> Double {
        return sqrt(3.0) / 4.0 * Double(self.aSide) * Double(self.aSide)
    }
}

var eqilTriangle = EquilateralTriangle(side: 6)
print("Area for Equilateral Triangle where Side = \(eqilTriangle.aSide) by famous Formula : \(eqilTriangle.calculateArea())")
print("Area for Equilateral Triangle where Side = \(eqilTriangle.aSide) by Hero's Formula : \(eqilTriangle.calculateAreaByHeroFormula())")
