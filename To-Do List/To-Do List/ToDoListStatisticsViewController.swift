//
//  ToDoListStatisticsViewController.swift
//  To-Do List
//
//  Created by Shreyas Bhave on 10/19/16.
//  Copyright © 2016 Shreyas Bhave. All rights reserved.
//

import UIKit

class ToDoListStatisticsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToStatsController(segue: UIStoryboardSegue) {
        let source: UITableViewController = segue.source as! UITableViewController
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
