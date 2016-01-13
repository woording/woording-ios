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
    
    typealias WordList = (name : String, Lang1 : [String], Lang2 :[String])
    var currentList: WordList = ("name", [""], [""])
    
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
        return currentList.Lang1.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
      
        
        let list = currentList.Lang1[indexPath.item]
        let trans = currentList.Lang2[indexPath.item]
        cell.textLabel!.text = list + "    " + trans
        return cell
    }
    

    
    

}

