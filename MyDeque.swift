class Deque<T> {
    enum ArrayError: Error {
        case OutOfBounds
        case EmptyDeque
    }
    
     var array: [T?]
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
    
    subscript(index: Int) -> T? {
        if isEmpty {
            print("No element")
            return nil
        } else if firstElementPointer + index >= array.count {
            print("Out of range")
            return nil
        }
        
        return array[firstElementPointer + index]
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
