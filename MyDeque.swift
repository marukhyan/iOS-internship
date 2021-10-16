class Deque<T> {
    enum ArrayError: Error {
        case OutOfBounds
        case EmptyDeque
    }
    
    private var array: [T?]
    private var firstElementPointer: Int
    
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
    
    func popFront() throws -> T {
        if firstElementPointer >= array.count {
            throw ArrayError.OutOfBounds
        }
        let element = array[firstElementPointer]
        array[firstElementPointer] = nil
        firstElementPointer += 1
        return element!
    }
    
    func popBack() throws -> T {
        if isEmpty {
            throw ArrayError.EmptyDeque
        }
        return array.removeLast()!
    }
    
    func first() throws -> T {
        if isEmpty {
            throw ArrayError.EmptyDeque
        }
        return array[firstElementPointer]!
    }
    
    func last() throws -> T {
        if isEmpty {
            throw ArrayError.EmptyDeque
        }
        return array.last!!
    }
    
    func insert(index: Int, element: T) throws {
        if firstElementPointer + index <= array.count {
            array.insert(element, at: firstElementPointer + index)
        }
        throw ArrayError.OutOfBounds
    }
    
    subscript(index: Int) -> T {
        if isEmpty {
            print("No element")
        } else if firstElementPointer + index >= array.count {
            print("Out of range")
        }
        return array[firstElementPointer + index]!
    }
    
    func sort<T: Comparable>(byMethod: (T,T) -> Bool) {
        
        for _ in firstElementPointer..<array.count {
            for j in (firstElementPointer + 1)..<array.count {
                if byMethod(array[j] as! T,array[j - 1] as! T) {
                    let tmp = array[j - 1]
                    array[j - 1] = array[j]
                    array[j] = tmp
                }
            }
        }
    }
    
    func findElement<T: Equatable>(element: T) ->  Bool {
        for i in 0..<array.count {
            if array[i] as! T == element {
                return true
            }
        }
        return false
    }
    
    func printElements() {
        for i in firstElementPointer..<array.count {
            print(array[i]!, terminator: " ")
        }
        print("\n")
    }
    
}

var deque = Deque<Int>()
deque.pushFront(element: 2)
deque.pushBack(element: 7)
deque.pushFront(element: 1)
deque.pushBack(element: 3)
deque.pushFront(element: 4)
deque.pushBack(element: 5)
deque.printElements()
deque.sort(byMethod: {(num1: Int, num2: Int) -> Bool in
            return num1 > num2})
deque.printElements()
deque.sort(byMethod: {(num1: Int, num2: Int) -> Bool in
            return num1 < num2})
deque.printElements()
print(deque.findElement(element: 0))
