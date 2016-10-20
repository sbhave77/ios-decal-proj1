//
//  ViewController.swift
//  To-Do List
//
//  Created by Shreyas Bhave on 10/19/16.
//  Copyright © 2016 Shreyas Bhave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var toDoItem: ToDoItem?

    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let barButton = sender as? UIButton
        print(barButton?.currentTitle)
        if barButton?.currentTitle == "Done"{
            if (self.textField.text?.characters.count)! > 0{
                self.toDoItem = ToDoItem(name: self.textField.text!)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent!) {
        self.view.endEditing(true)
    }

    


}

