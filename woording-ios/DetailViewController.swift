//
//  DetailViewController.swift
//  woording-ios
//
//  Created by Cor Pruijs on 09-01-16.
//  Copyright © 2016 Woording. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    typealias WordList = (name : String, Lang1 : [String], Lang2 :[String])
    var currentList: WordList = ("name", [""], [""]){
        didSet {
            // Configure the view after the currentList is changed
            self.configureView()
        }
    }
    
    func configureView() {
        
        // Update the detailview to show the correct list
        
        
        // Update the title of the viewController
        title = currentList.name
        
        if let label = self.detailDescriptionLabel {
            label.text = currentList.name
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

