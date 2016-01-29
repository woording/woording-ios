//
//  DisplayPage.swift
//  woording-ios
//
//  Created by Justin on 1/22/16.
//  Copyright © 2016 Woording. All rights reserved.
//

import Foundation
import UIKit
class ListInspector : UIViewController {
    typealias wordArray = (locale:String, words :[String])
    typealias WordList = (name : String, lang1: wordArray, lang2:wordArray)
    
    var currentList: WordList = ("name", ("this", ["sdfdf"]), ("this", ["sdfsdf"]))

    var name : String = "this"
}








class DisplayPage : ListInspector {
    var pageIndex : Int = 0
    
    var word : String = "Sdsd"
    var translation : String = "asdasd"
    
    @IBOutlet weak var wordLabel: UILabel!
    
    @IBOutlet weak var translationLabel: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
      //  wordLabel.text = word
        translationLabel.text = translation
        
}

}