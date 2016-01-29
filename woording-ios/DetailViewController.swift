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
    
    typealias wordArray = (locale:String, words: [String])
    typealias WordList = (name : String, lang1: wordArray, lang2:wordArray)
    
    var currentList: TranslationList? {
        didSet {
            title = currentList!.name
        }
    }
    
    func configureView() {
        // Update the detailview to show the correct list
        
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
    // MARK: table view
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let list = currentList {
            return list.translations.count
        } else {
            // No current list, thus there are 0 rows
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TranslationCell") as! TranslationCell
        
        cell.word1Label.text = currentList?.translations[indexPath.row].language1Text
        cell.word2Label.text = currentList?.translations[indexPath.row].language2Text
        
        return cell
    }
    

     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let cell = tableView.cellForRowAtIndexPath(indexPath)
        // this function is called when a word from a word list is selected
        // enact behavior that by starts the display mode (the default mode for words) on cell touch
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        
    }

}
