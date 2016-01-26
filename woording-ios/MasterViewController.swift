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
    
    typealias wordArray = (locale:String, words :[String])
    typealias WordList = (name : String, lang1: wordArray, lang2:wordArray)
    
    var allWordLists : [WordList] = []
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
       self.splitViewController?.preferredDisplayMode = .AllVisible
       
        
        // read lists from plist
        var optionalDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("Lists", ofType: "plist") {
            optionalDict = NSDictionary(contentsOfFile: path)
        }
        
        if let allTheLists = optionalDict {
            for list in allTheLists {
                
                let listName = list.key as! String //read list name (key for the diconaty represending the list)
                
                //build the lang1 array
                let lang1Words = list.value.valueForKey("lang1") as! [String]
                let lang1Locale = list.value.valueForKey("lang1Locale") as! String //grab locale
                let tempLang1 : wordArray = (lang1Locale, lang1Words)
                
                
                
                //build the lang2 array
                let lang2Words = list.value.valueForKey("lang2") as! [String]
                let lang2Locale = list.value.valueForKey("lang2Locale") as! String //grab locale
                let tempLang2 : wordArray = (lang2Locale, lang2Words)
                
                
              
                let newList : WordList = (listName, tempLang1, tempLang2)
                //assemble the wordlist from the wordArrays
                
                
                allWordLists.append(newList)
                
                
                
                
                
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