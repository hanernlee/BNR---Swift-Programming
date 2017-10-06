//: Playground - noun: a place where people can play

import UIKit

struct Stack<Element>: Sequence {
    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    mutating func pushAll<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        for item in sequence {
            self.push(item)
        }
    }
    
    func filter(_ f: (Element) -> Bool) -> Stack<Element> {
        var filteredItems = Stack<Element>()
        for item in items {
            if f(item) == true {
                filteredItems.push(item)
            }
        }
        return filteredItems
    }
    
    func map<U>(_ f: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)

var doubleStack = intStack.map { 2 * $0 }
print(doubleStack.pop())
print(doubleStack.pop())

print(intStack.pop())
print(intStack.pop())
print(intStack.pop())

var stringStack = Stack<String>()
stringStack.push("this is a string")
stringStack.push("another string")

print(stringStack.pop())

func myMap<T,U>(_ items: [T], _ f: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one", "two", "three"]
let stringLengths = myMap(strings) { $0.characters.count }
print(stringLengths)

func checkIfEqual<T : Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}
print(checkIfEqual(1, 1))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual("a string", "a different string"))

func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print(checkIfDescriptionsMatch(Int(1), UInt(1)))
print(checkIfDescriptionsMatch(1, 1.0))
print(checkIfDescriptionsMatch(Float(1.0), Double(1.0)))

struct StackIterator<T>: IteratorProtocol {
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

var myStackIterator = StackIterator(stack: myStack)

while let value = myStackIterator.next() {
    print("got \(value)")
}

for value in myStack {
    print("for in loop: got \(value)")
}

myStack.pushAll([1, 2, 3])
for value in myStack {
    print("after pushing: got \(value)")
}

var myOtherStack = Stack<Int>()
myOtherStack.pushAll([1, 2, 3])
myStack.pushAll(myOtherStack)
for value in myStack {
    print("After pushing items onto stack, got \(value)")
}

// Bronze Challenge
var filteredStack = myStack.filter({ $0 == 1 })
for value in filteredStack {
    print("Filtered stack values: \(value)")
}

// Silver & Gold Challenge from BNR forum
func findAll<T>(_ collection: T, _ element: Any) -> [Any] where T: Collection  {
    var locations: [Any] = []
    
    
    switch collection {
        
    case is Array<Any>:
        
        for (a,b) in collection.enumerated()  {
            
            if String(describing: b) == String(describing: element) {
                locations.append(a)
            }
        }
        
    case is Dictionary<AnyHashable, Any>:
        
        for (a,b) in collection as! [AnyHashable:Any] {
            if String(describing: b) == String(describing: element) {
                locations.append(a.base)
            }
        }
        
    case is String.CharacterView:
        
        for (a,b) in collection.enumerated() {
            if String(describing: b) == String(describing: element) {
                locations.append(a)
            }
        }
        
    default:
        
        print("Collection type not applicable")
        
    }
    
    return locations
}

findAll([5, 3, 7, 3, 9], 3) // Prints [1,3]

findAll(["a","f","c", "a", "b", "c", "c"], "c") // Returns [2,5,6]

findAll(["c":1, "b":2, "f":3, "a":0, "g":2], 2) // Returns ["b","g"]

findAll([3:"a", 1:"b", 4:"c", 2:"b"], "c") // Returns [4]

findAll("abcdedcba".characters, "d") // Returns [3,5]

let set: Set = ["a", "b", "c", "d"]
findAll(set, "c") // Returns [] and prints "Collection type not applicable"
