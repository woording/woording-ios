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
    var objects = [AnyObject]()
    
    typealias WordList = (name : String, Lang1 : [String], Lang2 :[String])
    var allWordLists : [WordList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allWordLists.append(("name", ["sdfsdf"], ["sdfsdf"]))
        // read lists from plist
        if let path = NSBundle.mainBundle().pathForResource("Lists", ofType: "plist"), dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            var templist : WordList
            var tempLang1 : [String] = []
            var tempLang2 : [String] = []
            for list in dict {
                
                
                print(list)
                
                
                let listDict = list.1 as! [String : String]
                for word in listDict
                {
                    tempLang1.append(word.0)
                    tempLang2.append(word.1)
                }
                templist.name = list.0
                templist.Lang1 = tempLang1
                templist.Lang2 = tempLang2
                allWordLists.append(templist)
                
            }
        }
        
        
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
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Add new object to objects
    func insertNewObject(sender: AnyObject) {
        
        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // If the segue is going to the DetailView
        if segue.identifier == "showDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                // get the list corresponding to the row
                let list = allWordLists[indexPath.row]
                //PRINT(LIST)
                // get the DetailViewController
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.currentList = list
                
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
        
        let list = allWordLists[indexPath.row].name
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
                objects.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
            } else if editingStyle == .Insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            }
    }
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let quiz = UITableViewRowAction(style: .Normal, title: "quiz") { (action, indexPath) in
            print("quiz")
        }
        
        let practice = UITableViewRowAction(style: .Normal, title: "practice") { (action, indexPath) in
            print("practice")
        }
        
        
        quiz.backgroundColor = UIColor.blueColor()
        practice.backgroundColor = UIColor.greenColor()
        return [quiz, practice]
    }

}