//
//  DetailViewController.swift
//  woording-ios
//
//  Created by Cor Pruijs on 09-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var listTableView: UITableView!
    
    
    typealias wordArray = (locale:String, words :[String])
    typealias WordList = (name : String, lang1: wordArray, lang2:wordArray)

    var currentList: WordList = ("name", ("this", [""]), ("this", [""]))
    
    func configureView() {
        
        // Update the detailview to show the correct list
        
        
        // Update the title of the viewController
        title = currentList.name
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(currentList)
        listTableView.dataSource = self
        listTableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //table view
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentList.lang1.words.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
      
        let index = indexPath.item
        let word  = currentList.lang1.words[index]
        let trans = currentList.lang2.words[index]
        cell.textLabel!.text = word + "    " + trans
        return cell
    }
    

     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        // this function is called when a word from a word list is selected 
        
    //enact behavior that by starts the display mode (the default mode for words) on cell touch
    }
    

}

