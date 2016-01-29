//
//  MasterViewController.swift
//  woording-ios
//
//  Created by Cor Pruijs on 09-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var editObjects = [AnyObject]()
    
    var allWordLists : [List] = []
    let S = Store()
    override func viewDidLoad() {
        
        
        
        
        super.viewDidLoad()
        self.splitViewController?.preferredDisplayMode = .AllVisible
        
        // read from plist via store
        allWordLists = S.readLocalListData()
        
        
        
        
        
        
        
        
        // print username and password, as a test
        print(AccountManager.name)
        print(AccountManager.password)
        
        
        
        self.title = "Lists"
        
        // Set the detailViewController property to the correct detailViewController
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Add new object to objects
    func insertNewObject(sender: AnyObject) {
        
        editObjects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // If the segue is going to the DetailView
        if segue.identifier == "showDetail" {
            self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                // get the list corresponding to the row
                let list = allWordLists[indexPath.row]
                //PRINT(LIST)
                // get the DetailViewController
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                //controller.currentList = list
                
                // Add the back button
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allWordLists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let list = allWordLists[indexPath.row].listName
        cell.textLabel!.text = list
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath) {
            
            if editingStyle == .Delete {
                editObjects.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
            } else if editingStyle == .Insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let quiz = UITableViewRowAction(style: .Normal, title: "quiz") { (action, indexPath) in
            // Handle going to Quiz mode here
            print("quiz")
        }
        
        let practice = UITableViewRowAction(style: .Normal, title: "practice") { (action, indexPath) in
            // Handle going to Practice mode here
            print("practice")
        }
        
        quiz.backgroundColor = UIColor.blueColor()
        practice.backgroundColor = UIColor.greenColor()
        return [quiz, practice]
    }
}