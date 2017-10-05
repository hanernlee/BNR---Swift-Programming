//: Playground - noun: a place where people can play

import UIKit

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}

// Silver Challenge
func computeWidths(for dataSource: TabularDataSource) -> [Int] {
    var columnWidths = [Int]()
    
    for i in 0 ..< dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        columnWidths.append(columnLabel.characters.count)
    }
    
    for i in 0 ..< dataSource.numberOfRows {
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
            if columnWidths[j] < item.characters.count {
                columnWidths[j] = item.characters.count
            }
        }
    }
    
    return columnWidths
}
//

func printTable(_ dataSource:TabularDataSource & CustomStringConvertible) {
    print("Table: \(dataSource.description)")
    var firstRow = "|"
    var columnWidths = computeWidths(for: dataSource)
    
    for i in 0 ..< dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        let paddingNeeded = columnWidths[i] - columnLabel.characters.count
        let padding = repeatElement(" ", count: paddingNeeded).joined()
        let columnHeader = " \(padding)\(columnLabel) |"
        firstRow += columnHeader
    }
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        var out = "|"
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
            var paddingNeeded = columnWidths[j] - item.characters.count
            if paddingNeeded < 0 { paddingNeeded = 0 }
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out += " \(padding)\(item) |"
        }
        
        print(out)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department (\(name))"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Employee Name"
        case 1: return "Age"
        case 2: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column!")
        }
    }
}


var department = Department(name: "Engineering")
department.add(Person(name:"Joe", age: 1000, yearsOfExperience: 6))
department.add(Person(name:"Karen", age: 40, yearsOfExperience: 18))
department.add(Person(name:"Fred", age: 50, yearsOfExperience: 20))
printTable(department)


// Gold Challenge
struct Book {
    let title: String
    let author: String
    let rating: Double
}

struct BookCollection: TabularDataSource, CustomStringConvertible {
    let name: String
    var books = [Book]()
    
    var description: String {
        return "Book Collection (\(name))"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ book: Book) {
        books.append(book)
    }
    
    var numberOfRows: Int {
        return books.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Title"
        case 1: return "Author"
        case 2: return "Average Rating"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let book = books[row]
        switch column {
        case 0: return book.title
        case 1: return book.author
        case 2: return String(book.rating)
        default: fatalError("Invalid column!")
        }
    }
}

var collection = BookCollection(name: "Chris' Programming Books")
collection.add(Book(title:"Swift", author: "Big Nerd Ranch", rating: 10.0))
collection.add(Book(title:"iOS", author: "Big Nerd Ranch", rating: 8.0))
collection.add(Book(title:"Ruby", author: "Sandi Metz", rating: 9.0))
printTable(collection)
