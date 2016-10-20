//
//  ToDoItem.swift
//  To-Do List
//
//  Created by Shreyas Bhave on 10/19/16.
//  Copyright © 2016 Shreyas Bhave. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    
    var iName: NSString = ""
    var check: Bool = false
    var creationDate: NSDate = NSDate()
    var dateOfCheck: NSDate? = nil
    
    init(name:String){
        self.iName = name as NSString
    }


}
