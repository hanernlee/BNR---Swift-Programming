//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Christopher Lee on 8/10/17.
//  Copyright © 2017 Christopher Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var tableField: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        print("Add todo  item \(String(describing: itemTextField.text))")
    }
}

