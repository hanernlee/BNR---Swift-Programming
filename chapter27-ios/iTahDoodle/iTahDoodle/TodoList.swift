//
//  TodoList.swift
//  iTahDoodle
//
//  Created by Christopher Lee on 8/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import UIKit

//class TodoList: NSObject {
//
//    private let fileURL: URL = {
//        let documentDirectoryURLS = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let documentDirectoryURL = documentDirectoryURLS.first!
//        return documentDirectoryURL.appendingPathComponent("todoList.items")
//    }()
//
//    var getCellInfo: (cellClass: AnyClass, reuseIdentifier: String) {
//        return (UITableViewCell.self, "Cell")
//    }
//
//    fileprivate var items: [String] = []
//
//    override init() {
//        super.init()
//        loadItems()
//    }
//
//    func saveItems() {
//        let itemsArray = items as NSArray
//
//        print("Saving items to \(fileURL)")
//        if !itemsArray.write(to: fileURL, atomically: true) {
//            print("Could not save to to-do list")
//        }
//    }
//
//    func loadItems() {
//        if let itemsArray = NSArray(contentsOf: fileURL) as? [String] {
//            items = itemsArray
//        }
//    }
//
//    func add(_ item: String) {
//        items.append(item)
//        saveItems()
//    }
//
//    func remove(_ index: Int) {
//        items.remove(at: index)
//        saveItems()
//    }
//}
//
//extension TodoList: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let item = items[indexPath.row]
//
//        cell.textLabel!.text = item
//        return cell
//    }
//}

class TodoList: NSObject {
    private let fileURL: URL = {
        let documentDirectoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.appendingPathComponent("todolist.items")
    }()
    
    fileprivate var items: [String] = []
    
    //Silver Challenge - provide a tuple for the View Controller to get cell info from the model
    //without a priori knowledge of its desired class and identifier
    var cellInfo: (cellClass: AnyClass, cellIdentifier: String ) {
        get {
            return (UITableViewCell.self, "Cell")
        }
    }
    
    override init() {
        super.init()
        loadItems()
    }
    
    func saveItems() {
        let itemsArray = items as NSArray
        print("Saving items to \(fileURL)")
        if !itemsArray.write(to: fileURL, atomically: true) {
            print("Could not save to-do list")
        }
    }
    
    func loadItems() {
        if let itemsArray = NSArray(contentsOf: fileURL) as? [String] {
            items = itemsArray
        }
    }
    
    func add(_ item: String){
        items.append(item)
        saveItems()
    }
    
    func remove(at index: Int) {
        items.remove(at: index)
        saveItems()
    }
}

extension TodoList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel!.text = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
}
