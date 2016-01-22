//
//  DisplayPage.swift
//  woording-ios
//
//  Created by Justin on 1/22/16.
//  Copyright © 2016 Woording. All rights reserved.
//

import Foundation
import UIKit


class DisplayPage : UIViewController {
    var pageIndex : Int = 0
    var word : String = ""
    var translation : String = ""
    
    @IBOutlet weak var wordLabel: UILabel!
    
    @IBOutlet weak var translationLabel: UILabel!
    
    override func viewDidLoad() {
   super.viewDidLoad()
        wordLabel.text = word
        translationLabel.text = translation
    
}

}