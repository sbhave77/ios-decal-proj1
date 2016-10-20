//
//  ToDoListTableViewController.swift
//  To-Do List
//
//  Created by Shreyas Bhave on 10/19/16.
//  Copyright © 2016 Shreyas Bhave. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var listOfItems: NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let listItems = listOfItems as NSArray as! [ToDoItem]
        for item in listItems{
            let dateOfItem = item.dateOfCheck
            if (dateOfItem != nil) {
                if (-1 * dateOfItem!.timeIntervalSinceNow > (24 * 60 * 60) && item.check) {
                    self.listOfItems.remove(item)
                }
            }
        }
        return self.listOfItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIndentifier: NSString = "ListPrototypeCell"
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIndentifier as String)! as UITableViewCell
        
        let todoitem: ToDoItem = self.listOfItems.object(at: indexPath.row) as! ToDoItem
        
        cell.textLabel?.text = todoitem.iName as String
        
        if todoitem.check{
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        let tappedItem: ToDoItem = self.listOfItems.object(at: indexPath.row) as! ToDoItem
        
        tappedItem.check = !tappedItem.check
        
        if (tappedItem.check) {
            tappedItem.dateOfCheck = NSDate()
        }
        
        tableView.reloadData()
        
    }

    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue)
    {
        // Pull any data from the view controller which initiated the unwind segue.
        let source: ViewController = segue.source as! ViewController

        if (source.toDoItem != nil){
            self.listOfItems.add(source.toDoItem!)
            self.tableView.reloadData()
        }        
    }
    
    @IBAction func unwindToViewControllerStats(segue: UIStoryboardSegue) {
        
    }
    
    func loadInitialData(){
        
        let item1 = ToDoItem(name: "Finish research")
        self.listOfItems.add(item1)
        
        let item2 = ToDoItem(name: "CS 161 Design Doc")
        self.listOfItems.add(item2)
        
        let item3 = ToDoItem(name: "Finish iosDecal Project 1")
        self.listOfItems.add(item3)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }


    
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            listOfItems.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
