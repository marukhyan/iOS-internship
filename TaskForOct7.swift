/*
 Task 1
 Experiment with deinit. Create class named Table. Inside init method of the class print text "creating table", and inside deinit print text "destroying table". Create method for table class named description and print some text inside it. Create a method which takes object of Table as an argument and calls description method inside it. Create an object of Table class, then call method which you created and pass object of table class there. See how things are working. Explain in a comment the behavior you saw.
 */

class Table {
    var weight: Int
    
    init(weight: Int) {
        self.weight = weight
        print("creating table")
    }
    
    deinit {
        print("destroying table")
    }
    
    func description() {
        print("The weight of table is \(weight)kg")
    }
        
}

func descriptionCaller(table: Table) {
    table.description()
    //let testObject = Table(weight: 67)
}

var table = Table(weight: 55)
descriptionCaller(table: table)

/*
 Deinitializes will no be called for table instance because we are not going out of scope. But if we create an instance of Table class in descriptionCaller(f. e. testObject)... Deinitializer will be called for testObject.
 */
