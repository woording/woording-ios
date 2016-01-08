//
//  ViewController.swift
//  wording
//
//  Created by Cor Pruijs on 22-09-15.
//  Copyright © 2015 Cor Pruijs. All rights reserved.
//

import UIKit
import RealmSwift
class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
    var listsArchive : [String : [String:String]] = ["listName" : ["word1": "trans1", "word2" : "trans2"]]
    var listNames : [String]
    

    @IBOutlet weak var listTable: UITableView!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wordingService = WordingService()
        
        listTable.dataSource = self
        
        //read Lists from Plist.
        //recreate listArchive from plist. 
        
        // listArchive = [READ FROM PLIST]
        
        
        
        
        //assemple array of names for data table source
        for list in listsArchive {
            self.listNames.append( list.0 )
        }
               
        
        //get list example
        wordingService.getUser("cor", callback: {
        json in
        print(json)
        }
        
        )
        
        
    }

    
    
    
    
    
    
    
    
//Table View 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->   UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.clearColor()
        let label = UILabel(frame: CGRect(x:0, y:0, width:200, height:50))
        label.text = self.lists.
        cell.addSubview(label)
        return cell
    }
    
    
    // UITableViewDelegate Functions
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

