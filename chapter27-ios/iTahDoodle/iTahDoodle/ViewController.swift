//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Christopher Lee on 8/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var tableField: UITableView!
    @IBOutlet var insertButton: UIButton!
    @IBOutlet var doneButton: UIButton!
    
    let todoList = TodoList()
    
    private func configureControlsForEditMode() {
        itemTextField.isHidden = true
        insertButton.isHidden = true
        doneButton.isHidden = false
        tableField.setEditing(true, animated: true)
    }
    
    private func configureControlsForInsertMode() {
        itemTextField.isHidden = false
        insertButton.isHidden = false
        doneButton.isHidden = true
        tableField.setEditing(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        tableField.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let cellInfo = todoList.cellInfo
        tableField.register(cellInfo.cellClass, forCellReuseIdentifier: cellInfo.cellIdentifier)
        tableField.dataSource = todoList
        
        tableField.delegate = self
        configureControlsForInsertMode()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        // Bronze Challenge
        guard let todo = itemTextField.text, !todo.isEmpty else {
            return
        }
        todoList.add(todo)
        itemTextField.text = ""
        tableField.reloadData()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton){
        itemTextField.text = ""
        configureControlsForInsertMode()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        configureControlsForEditMode()
    }
}

