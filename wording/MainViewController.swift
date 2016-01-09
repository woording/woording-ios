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
  
    typealias List = (Lang1: [String], Lang2:  [String])
    var selectedList : List = ([""], [""])
    
    
    
    
    
    var listsArchive : [String : [String:String]] = ["defaut" : ["word1": "trans1", "word2" : "trans2"]]
    var listNames : [String] = []
    var name : String = "" 


  //  @IBOutlet weak var optionView: UIView!
    @IBOutlet var nameLabel: UILabel! //welcome text
    @IBOutlet weak var listTable: UITableView! //tableView for Lists
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedList.Lang1 = []
        selectedList.Lang2 = []
         let wordingService = WordingService()
        
            self.nameLabel.text   = "Welcome, " + name
            listsArchive.removeAll()
        // cleans the archive for plist read
        
       
        
            listTable.dataSource = self
            listTable.delegate = self
        
        //read Lists from Plist.
        //recreate listArchive from plist. 
        
        
        
        
        if let path = NSBundle.mainBundle().pathForResource("Lists", ofType: "plist"), dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            
            for list in dict {
                //assemple array of names for data table source

                listNames.append( list.0 )
                listsArchive[list.0] = list.1 as! [String : String]
            }
        }
        
        
        
        
     
               
        
        //get list example
        wordingService.getUser("cor", callback: {
        json in
        print(json)
        }
        
        )
        
        
    }

    
    
    
    
    
    
    
    
//Table View 
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      // let spot =  tableView.cellForRowAtIndexPath(indexPath)?.frame.origin
        
        typealias List = (Lang1: [String], Lang2:  [String])
        
     
       
        
    
        
        
        
        
        
       let listDict = listsArchive["\(listNames[indexPath.item])"]
        print ("this one V")
        print (listsArchive)
        print(listNames[indexPath.indexAtPosition(0)])
        for wordList in listDict!
        {
            selectedList.Lang1.append(wordList.0)
            selectedList.Lang2.append(wordList.1)
           print(wordList)
        }
        
        
        
        
        performSegueWithIdentifier("goToListInspector", sender: nil)
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNames.count
    }
    
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->   UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.clearColor()
        let label = UILabel(frame: CGRect(x:0, y:0, width:200, height:50))
        label.text = "\t" + listNames[indexPath.item]
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

//segue moves 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ListInspectorView
        
        
        if segue.identifier != nil { //check if there is an ID for the seg
            
            switch segue.identifier!{ //if there is an ID switch against these values
            case "goToListInspector" :
                print("assign list to inspector controller")
               controller.inspectorList.Lang1 = selectedList.Lang1
               controller.inspectorList.Lang2 = selectedList.Lang2
                
                
                
            case "that" : //never going to happen
                print("that")
            default :    //this either.
                print("what")
            }
        }
    }

}

