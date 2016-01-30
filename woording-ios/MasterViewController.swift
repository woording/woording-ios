//
//  MasterViewController.swift
//  woording-ios
//
//  Created by Cor Pruijs on 09-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import UIKit
import RealmSwift

class MasterViewController: UITableViewController {
    
    let realm = try! Realm()
    lazy var translationLists: Results<TranslationList> = { self.realm.objects(TranslationList) }()
    
    var detailViewController: DetailViewController? = nil
    var editObjects = [AnyObject]()
    
    var notificationToken: NotificationToken? // used for reloading data on realm changes
    
    // This is unfortunately broken, Justin, read my comment inside Store.swift
    override func viewDidLoad() {
        
        
        // Setup UI
        super.viewDidLoad()
        self.splitViewController?.preferredDisplayMode = .AllVisible
        self.title = "Lists"
        
        // reload data on realm change
        notificationToken = realm.addNotificationBlock { [unowned self] note, realm in
            
            // Reload the tableview data when there's new data in the realm
            self.reloadData()
        }
        
        // Set the detailViewController property to the correct detailViewController
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
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
                let list = translationLists[indexPath.row]
                
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
        return translationLists.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Deque a new cell
        let cell = tableView.dequeueReusableCellWithIdentifier("TranslationListCell", forIndexPath: indexPath) as! TranslationListCell
        
        // Retrieve the appropiate list
        let list = translationLists[indexPath.row]
        
        // Set the cell's properties to reflect the list's data
        cell.listNameLabel.text = list.name
        cell.language1Label.text = list.language1Code
        cell.language2Label.text = list.language2Code
        
        // Return the cell
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
    
    // MARK: - Data handeling
    func reloadData() {
        tableView.reloadData()
    }
    
    // MARK: - Bar button items
    @IBAction func addButtonPressed(sender: AnyObject) {
        WoordingService.addListsToRealm()
    }
    
    
    @IBAction func clearButtonPressed(sender: AnyObject) {
        try! realm.write {
            realm.deleteAll()
        }
    }
}

