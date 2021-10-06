/*
 Task 1
 Create class Wrapper. Inside Wrapper class define struct called Item. Item struct should have one Int parameter named value. For Wrapper class add initializer which will get object of Item type and will assign it to property of the class of type Item. Then create object of type Item and object of type Wrapper. Pass that newly create Item object to the object of Wrapper type.
 */

class Wrapper {
    struct Item {
        var value: Int
    }
    var item = Item(value: 5)
    
    init(item: Item) {
        self.item = item
    }
}

var item = Wrapper.Item(value: 10)
var wrapper = Wrapper(item: item)
print(wrapper.item.value)

