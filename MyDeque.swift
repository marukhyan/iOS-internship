class Deque<T> {
    var array: [T?]
    var firstElementPointer: Int
    
    var count: Int { return array.count - firstElementPointer }
    var isEmpty: Bool { return count == 0 }
    
    init() {
        firstElementPointer = 1
        array = [nil]
    }
    
    init(capacity: Int) {
        array = [T?](repeating: nil, count: max(capacity, 1))
        firstElementPointer = capacity
    }
    
    init(deque: Deque) {
        array = deque.array
        firstElementPointer = deque.firstElementPointer
    }
    
    func pushBack(element: T) {
        array.append(element)
    }
    
    func pushFront(element: T) {
        if firstElementPointer == 0 {
            let temp = [T?](repeating: nil, count: array.count)
            array.insert(contentsOf: temp, at: 0)
            firstElementPointer = temp.count
        }
        firstElementPointer -= 1
        array[firstElementPointer] = element
    }
    
    func popFront() -> T? {
        if firstElementPointer >= array.count {
            print("No element")
            return nil
        }
        
        let element = array[firstElementPointer]
        array[firstElementPointer] = nil
        firstElementPointer += 1
        
        return element
    }
    
    func popBack() -> T? {
        if isEmpty {
            print("No element")
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    func first() -> T? {
        if isEmpty {
            return nil
        } else {
            return array[firstElementPointer]!
        }
    }
    
    func last() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.last!
        }
    }
    
    func insert(number: T,position: Int) {
        if firstElementPointer + position <= array.count {
            array.insert(number, at: firstElementPointer + position)
        } else {
            print("Out of bounds")
        }
    }
    
    func printElements() {
        for elem in array {
            if elem != nil {
                print(elem!, terminator: " ")
            }
        }
        print("\n")
    }
    
}

// Testing my Deque

var deque = Deque<Int>()

deque.pushBack(element: 1)
deque.pushBack(element: 2)
deque.pushFront(element: 3)
deque.pushFront(element: 4)
deque.printElements()

_ = deque.popFront()
_ = deque.popFront()
_ = deque.popFront()
_ = deque.popFront()

_ = deque.popFront()
_ = deque.popBack()

deque.insert(number: 6, position: 0)
deque.insert(number: 7, position: 1)
deque.insert(number: 8, position: 2)

deque.insert(number: 9, position: 10)
deque.printElements()

var deque2 = Deque(deque: deque)
deque2.printElements()
print(deque2.array)
deque2.pushFront(element: 9)
deque2.pushFront(element: 9)
deque2.pushFront(element: 9)
deque2.pushFront(element: 9)
deque2.pushFront(element: 9)
deque2.pushFront(element: 9)
deque2.pushFront(element: 9)
deque2.pushFront(element: 9)
deque2.pushFront(element: 9)
deque2.pushFront(element: 9)

deque2.pushFront(element: 9)
deque2.pushFront(element: 9)
deque2.pushFront(element: 9)
deque2.pushFront(element: 9)
deque2.pushFront(element: 9)
deque2.pushFront(element: 9)

print(deque2.array)
print(deque2.first()!)
print(deque2.last()!)
