class Stack<T> {
    private var array = [T?]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    func push(element: T) {
        array.append(element)
    }
    
    func pop() -> T? {
        return array.popLast()!
    }
    
    var top: T? {
        return array.last!
    }
    
    subscript(index: Int) -> T? {
        if index >= 0 && index < count {
            return array[index]
        }
        return nil
    }
    
}

var stack = Stack<Int>()
print(stack.isEmpty)
stack.push(element: 6)
print(stack.count)
stack.push(element: 9)
stack.push(element: 8)
print(stack[0]!)
print(stack[1]!)
print(stack.pop()!)
print(stack.top!)
